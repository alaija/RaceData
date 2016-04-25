//
//  RDRaceInfoViewController.m
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

#import "RDRaceInfoViewController.h"

#import "RDRaceInfoViewOutput.h"
#import "PureLayout.h"
#import "UIView+BlocksKit.h"

@interface RDRaceInfoViewController ()

@property (nonatomic, strong) NSDateFormatter *timeFormater;

@property (nonatomic, strong) UILabel *speedLabel;
@property (nonatomic, strong) UILabel *speedTimeLabel;
@property (nonatomic, strong) UILabel *speed30Label;
@property (nonatomic, strong) UILabel *speed60Label;
@property (nonatomic, strong) UILabel *speed100Label;
@property (nonatomic, strong) UILabel *motionTimeLabel;

@property (nonatomic) BOOL started;
@property (nonatomic) BOOL shouldUpdateTime;

@property (nonatomic) NSDate *startTime;
@property (nonatomic) NSString *speedFormat;

@end

@implementation RDRaceInfoViewController

@synthesize nightMode = _nightMode;
@synthesize metricSystem = _metricSystem;

#pragma mark - Internal

- (void)updateSpeedStartTime
{
    _startTime = _startTime ?: [NSDate date];
    _speedTimeLabel.text = [NSString stringWithFormat:@"Speed start: %@", [_timeFormater stringFromDate:_startTime]];
    _shouldUpdateTime = NO;
}

- (void)setupSpeedLabel
{
    _speedLabel = [UILabel new];
    _speedLabel.font = [UIFont systemFontOfSize:30.];
    _speedLabel.text = @"waiting...";
    
    [self.view addSubview:_speedLabel];
    
    [NSLayoutConstraint autoCreateAndInstallConstraints:^{
        [self.speedLabel autoCenterInSuperview];
    }];
}

- (void)setupTimeLabels
{
    _speedTimeLabel = [UILabel new];
    [self.view addSubview:_speedTimeLabel];
    
    _speed30Label = [UILabel new];
    [self.view addSubview:_speed30Label];
    
    _speed60Label = [UILabel new];
    [self.view addSubview:_speed60Label];
    
    _speed100Label = [UILabel new];
    [self.view addSubview:_speed100Label];
    
    _motionTimeLabel = [UILabel new];
    [self.view addSubview:_motionTimeLabel];
    
    [NSLayoutConstraint autoCreateAndInstallConstraints:^{
        [self.speedTimeLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.speedTimeLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:40.];
        [self.motionTimeLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.motionTimeLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:20.];
        [self.speed30Label autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.speed30Label autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.speedLabel withOffset:10.];
        [self.speed60Label autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.speed60Label autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.speed30Label withOffset:10.];
        [self.speed100Label autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.speed100Label autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.speed60Label withOffset:10.];
    }];
}

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad
{
	[super viewDidLoad];
    _timeFormater = [[NSDateFormatter alloc] init];
    [_timeFormater setDateFormat:@"HH:mm:ss.S"];
    
    [self setRestorationIdentifier:@"RaceInfo"];
    
	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы RDRaceInfoViewInput

- (void)setupInitialState
{
	// В этом методе происходит настройка параметров view, зависящих от ее жизненого цикла (создание элементов, анимации и пр.)
    [self setupSpeedLabel];
    [self setupTimeLabels];
    self.shouldUpdateTime = NO;
    self.view.backgroundColor = [UIColor clearColor];
    self.speedTimeLabel.textColor = [UIColor whiteColor];
    self.motionTimeLabel.textColor = [UIColor whiteColor];
    self.speedLabel.textColor = [UIColor whiteColor];
    self.speed30Label.textColor = [UIColor whiteColor];
    self.speed60Label.textColor = [UIColor whiteColor];
    self.speed100Label.textColor = [UIColor whiteColor];
}

- (void)setMetricSystem:(BOOL)metricSystem
{
    _metricSystem = metricSystem;
    [self updateFormat];
}

- (void)updateFormat
{
    _speedFormat = [NSString stringWithFormat:@"%%.1f %@", (_metricSystem
                                                            ?  NSLocalizedString(@"KMPH", nil)
                                                            : NSLocalizedString(@"MPH", nil))];
}

- (void)setupReadyToStartState
{
    self.speedTimeLabel.text = @"";
    self.motionTimeLabel.text = @"";
    self.speed30Label.text = @"";
    self.speed60Label.text = @"";
    self.speed100Label.text = @"";
    self.speedLabel.text = @"Tap to start";
    _startTime = nil;
    
    [self.view bk_whenTapped:^{
        if (_started)
        {
            _started = NO;
            [self.output didTriggerRaceStopEvent];
        } else {
            _started = YES;
            [self.output didTriggerRaceStartEvent];
        }
    }];
}

- (void)setupRaceState
{
    self.speedLabel.text = [NSString stringWithFormat:_speedFormat, 0.];
}

- (void)updateSpeed:(CGFloat)speed
{
    if (_started) {
        if (_shouldUpdateTime && speed > 0) {
            [self updateSpeedStartTime];
        } else if (speed == 0) {
            _shouldUpdateTime = YES;
        } else if (!_shouldUpdateTime && _startTime) {
            if (speed >= 30 && self.speed30Label.text.length == 0) {
                self.speed30Label.text = [NSString stringWithFormat:@"0-%.2f: %f", speed, [[NSDate date] timeIntervalSinceDate:_startTime]];
            } else if (speed >= 60 && self.speed60Label.text.length == 0) {
                self.speed60Label.text = [NSString stringWithFormat:@"0-%.2f: %f", speed, [[NSDate date] timeIntervalSinceDate:_startTime]];
            } else if (speed >= 100 && self.speed100Label.text.length == 0) {
                self.speed100Label.text = [NSString stringWithFormat:@"0-%.2f: %f", speed, [[NSDate date] timeIntervalSinceDate:_startTime]];
            }
        }
        
        self.speedLabel.text = [NSString stringWithFormat:_speedFormat, speed];
    }
}

- (void)updateMotionStartTime
{
    _startTime = _startTime ?: [NSDate date];
    _motionTimeLabel.text = [NSString stringWithFormat:@"Motion start: %@", [_timeFormater stringFromDate:[NSDate date]]];
}

#pragma mark - Методы RDRootContent

- (UIViewController *)viewController
{
    return self;
}

- (BOOL)canBeHudded
{
    return NO;
}

@end