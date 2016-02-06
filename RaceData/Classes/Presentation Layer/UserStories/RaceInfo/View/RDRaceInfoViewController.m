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
@property (nonatomic, strong) UILabel *motionTimeLabel;

@property (nonatomic) BOOL started;
@property (nonatomic) BOOL shouldUpdateTime;

@end

@implementation RDRaceInfoViewController

#pragma mark - Internal

- (void)updateSpeedStartTime
{
    _speedTimeLabel.text = [NSString stringWithFormat:@"Speed start: %@", [_timeFormater stringFromDate:[NSDate date]]];
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
    
    _motionTimeLabel = [UILabel new];
    [self.view addSubview:_motionTimeLabel];
    
    [NSLayoutConstraint autoCreateAndInstallConstraints:^{
        [self.speedTimeLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.speedTimeLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:40.];
        [self.motionTimeLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.motionTimeLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:20.];
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
}

- (void)setupReadyToStartState
{
    self.speedTimeLabel.text = @"";
    self.motionTimeLabel.text = @"";
    
    self.speedLabel.text = @"Tap to start";
    
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
    self.speedLabel.text = @"0.0 km/h";
}

- (void)updateSpeed:(CGFloat)speed
{
    if (_started) {
        if (_shouldUpdateTime && speed > 0) {
            [self updateSpeedStartTime];
        } else if (speed == 0) {
            _shouldUpdateTime = YES;
        }
        self.speedLabel.text = [NSString stringWithFormat:@"%.1f km/h", speed];
    }
}

- (void)updateMotionStartTime
{
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