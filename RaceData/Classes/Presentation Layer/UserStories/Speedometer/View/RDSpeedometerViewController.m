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

@interface RDSpeedometerViewController ()

@property (nonatomic, strong) RDSpeedometerView *speedometer;

@end

@implementation RDSpeedometerViewController

@synthesize nightMode = _nightMode;

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];

    [self setRestorationIdentifier:@"Speedometer"];
    
	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы RDSpeedometerViewInput

- (void)setupInitialState {
    // В этом методе происходит настройка параметров view, зависящих от ее жизненого цикла (создание элементов, анимации и пр.)
    self.speedometer = [[RDSpeedometerView alloc] init];
    self.speedometer.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.speedometer];
    [self.speedometer setNeedsDisplay];
    
    [NSLayoutConstraint autoCreateAndInstallConstraints:^{
        [self.speedometer autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view withOffset:40 relation:NSLayoutRelationGreaterThanOrEqual];
        
        [self.speedometer autoMatchDimension:ALDimensionHeight toDimension:ALDimensionWidth ofView:self.speedometer withMultiplier:.87];
        [[self.speedometer autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view withOffset:-20.] setPriority:UILayoutPriorityDefaultLow];
        [self.speedometer autoCenterInSuperview];
    }];
    [self.speedometer setSpeed:0];
}

- (void)updateSpeed:(CGFloat)speed
{
    [self.speedometer setSpeed:speed];
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