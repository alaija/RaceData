//
//  RDSpeedometerViewController.m
//  RaceData
//
//  Created by alaija on 09/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDSpeedometerViewController.h"

#import "RDSpeedometerViewOutput.h"

#import "RDSpeedometerView.h"
#import "PureLayout.h"
#import "RDOverspeedView.h"
#import "UIScreen+RDScreen.h"
#import "RDSpeedLmitView.h"

@interface RDSpeedometerViewController ()

@property (nonatomic, strong) RDSpeedometerView *speedometer;
@property (nonatomic, strong) RDOverspeedView *overspeedView;
@property (nonatomic, strong) RDSpeedLmitView *speedLimitView;

@property (nonatomic, strong) NSLayoutConstraint *overspeedTopConstraint;
@property (nonatomic, strong) NSLayoutConstraint *speedLimitCenterConstraint;
@property (nonatomic, strong) NSLayoutConstraint *speedLimitWidthConstraint;
@end

@implementation RDSpeedometerViewController

@synthesize nightMode = _nightMode;
@synthesize speedLimit = _speedLimit;

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setRestorationIdentifier:@"Speedometer"];
    
    [self.output didTriggerViewReadyEvent];
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    _overspeedTopConstraint.constant = (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)
                                       ? [RDOverspeedView layoutTopInset]
                                       : 10.);
    _speedLimitCenterConstraint.constant = (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)
                                          ? 0.
                                          : [RDSpeedLmitView layoutCenterOffset]);
}

- (void)setSpeedLimit:(CGFloat)speedLimit
{
    _speedLimit = speedLimit;
    [self.speedLimitView setSpeedLimit:speedLimit];
}
#pragma mark - Методы RDSpeedometerViewInput

- (void)setupInitialState {
    // В этом методе происходит настройка параметров view, зависящих от ее жизненого цикла (создание элементов, анимации и пр.)
    self.speedometer = [[RDSpeedometerView alloc] init];
    self.speedometer.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.speedometer];
    [self.speedometer setNeedsDisplay];
    
    self.overspeedView = [RDOverspeedView new];
    [self.overspeedView setHidden:YES];
    [self.view addSubview:self.overspeedView];
    
    self.speedLimitView = [RDSpeedLmitView new];
    [self.view addSubview:self.speedLimitView];
    
    [NSLayoutConstraint autoSetIdentifier:@"RDSpeedometerViewController constraints" forConstraints:^{
        [self.speedometer autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view withOffset:40 relation:NSLayoutRelationGreaterThanOrEqual];
        
        [self.speedometer autoMatchDimension:ALDimensionHeight toDimension:ALDimensionWidth ofView:self.speedometer withMultiplier:.91];
        [self.speedometer autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view withOffset:-20. relation:NSLayoutRelationLessThanOrEqual];
        [self.speedometer autoCenterInSuperview];
        
        _overspeedTopConstraint =
        [self.overspeedView autoPinEdgeToSuperviewEdge:ALEdgeTop
                                             withInset:(UIInterfaceOrientationIsPortrait([[UIApplication sharedApplication] statusBarOrientation])
                                                        ? [RDOverspeedView layoutTopInset]
                                                        : 10.)];
        [self.overspeedView autoSetDimension:ALDimensionWidth toSize:260.];
        [self.overspeedView autoSetDimension:ALDimensionHeight toSize:50.];
        [self.overspeedView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        [self.speedLimitView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:20.];
        [self.speedLimitView autoSetDimension:ALDimensionWidth toSize:[RDSpeedLmitView layoutWidth]];
        [self.speedLimitView autoSetDimension:ALDimensionHeight toSize:[RDSpeedLmitView layoutWidth]];
        _speedLimitCenterConstraint =
        [self.speedLimitView autoConstrainAttribute:ALAttributeVertical
                                        toAttribute:ALAttributeVertical
                                             ofView:self.view
                                         withOffset:(UIInterfaceOrientationIsPortrait([[UIApplication sharedApplication] statusBarOrientation])
                                                     ? 0.
                                                     : [RDSpeedLmitView layoutCenterOffset])];
    }];
    
    [self.speedometer setSpeed:0];
}

- (void)updateSpeed:(CGFloat)speed
{
    BOOL overspeed = (_speedLimit != -1 && speed >_speedLimit);
    
    [self.speedometer setSpeed:speed];
    [self.speedometer setOverSpeedLimit:overspeed];
    
    [self. overspeedView setAnimate:overspeed];
}


#pragma mark - Методы RDRootContent

- (UIViewController *)viewController
{
    return self;
}

- (BOOL)canBeHudded
{
    return YES;
}

@end