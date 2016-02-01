//
//  RDGPSViewController.m
//  RaceData
//
//  Created by alaija on 01/02/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDGPSViewController.h"

#import "RDGPSViewOutput.h"

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
}

- (void)updateSignalQualityLevel:(CGFloat)level
{
    
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