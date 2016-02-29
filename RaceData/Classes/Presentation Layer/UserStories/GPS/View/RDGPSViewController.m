//
//  RDGPSViewController.m
//  RaceData
//
//  Created by alaija on 01/02/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDGPSViewController.h"

#import "RDGPSViewOutput.h"
#import "UILabel+RDLabel.h"
#import "PureLayout.h"

@interface RDGPSViewController ()

@property (nonatomic, strong) UILabel *gpsLabel;
@property (nonatomic, strong) UIImageView *gpsSignalImageView;

@end

@implementation RDGPSViewController

@synthesize nightMode = _nightMode;

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы RDGPSViewInput

- (void)setupInitialState {
	// В этом методе происходит настройка параметров view, зависящих от ее жизненого цикла (создание элементов, анимации и пр.)
    _gpsLabel = [UILabel new];
    [UILabel setupLabelAsDefault:_gpsLabel];
    _gpsLabel.text = @"GPS";
    [self.view addSubview:_gpsLabel];

    _gpsSignalImageView = [UIImageView new];
    _gpsSignalImageView.image = [UIImage imageNamed:@"noGPS"];
    [self.view addSubview:_gpsSignalImageView];
    
    [NSLayoutConstraint autoSetIdentifier:@"GPS CONSTRAINTS" forConstraints:^{
        [_gpsLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10.];
        [_gpsLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [_gpsSignalImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_gpsLabel];
        [_gpsSignalImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    }];
}

- (void)updateSignalQualityLevel:(NSUInteger)level
{
    switch (level) {
        case 1:
            _gpsSignalImageView.image = [UIImage imageNamed:@"badGPS"];
            break;
        case 2:
            _gpsSignalImageView.image = [UIImage imageNamed:@"normalGPS"];
            break;
        case 3:
            _gpsSignalImageView.image = [UIImage imageNamed:@"goodGPS"];
            break;
        case 4:
            _gpsSignalImageView.image = [UIImage imageNamed:@"bestGPS"];
            break;
            
        default:
            _gpsSignalImageView.image = [UIImage imageNamed:@"noGPS"];
            break;
    }
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