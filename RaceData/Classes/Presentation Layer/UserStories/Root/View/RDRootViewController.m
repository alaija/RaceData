//
//  RDRootViewController.m
//  RaceData
//
//  Created by alaija on 27/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDRootViewController.h"

#import "RDRootViewOutput.h"
#import "RDRootContent.h"
#import "PureLayout.h"

@interface RDRootViewController()

@property (nonatomic) BOOL hudded;
@property (nonatomic, strong) UIViewController *currentContentViewController;
@property (nonatomic, strong) UIButton *hudButton;
@end

@implementation RDRootViewController

- (void)toogleHudded
{
    if (_hudded) {
        self.view.transform = CGAffineTransformMakeScale(1., 1.);
    } else {
        self.view.transform = CGAffineTransformMakeScale(1., -1.);
    }
    _hudded = !_hudded;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (void)configureAsHUDButton:(UIButton *)button
{
    if (button) {
        [button setTitle:@"HUD" forState:UIControlStateNormal];
        [button removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
        [button addTarget:self action:@selector(toogleHudded) forControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad
{
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы RDRootViewInput

- (void)setupInitialState
{
	// В этом методе происходит настройка параметров view, зависящих от ее жизненого цикла (создание элементов, анимации и пр.)
}

#pragma mark - Методы RDRootCOntentEmbeder

- (void)embedContent:(id<RDRootContent>)content
{
    if (self.currentContentViewController != nil) {
        [self.currentContentViewController.view removeFromSuperview];
        [self.currentContentViewController removeFromParentViewController];
    }
    
    BOOL contentCanBeHudded = [content canBeHudded];
    if (!contentCanBeHudded && _hudded) {
        [self toogleHudded];
    }
    
    UIViewController *controller = [content viewController];
    [self addChildViewController:controller];
    [self.contentContainerView addSubview:controller.view];
    self.currentContentViewController = controller;
    [controller.view autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    
    if ([content respondsToSelector:@selector(leftNavigationButton)]) {
        self.leftNavigationButton = [content leftNavigationButton];
    } else {
        self.leftNavigationButton = nil;
    }
    
    if ([content respondsToSelector:@selector(rightNavigationButton)]) {
        self.rightNavigationButton = [content rightNavigationButton];
    } else {
        self.rightNavigationButton = nil;
    }
    
    if ([content respondsToSelector:@selector(leftActionButton)]) {
        self.leftActionButton = [content leftActionButton];
    } else if (contentCanBeHudded) {
        [self configureAsHUDButton:self.leftActionButton];;
    } else {
        self.leftActionButton.hidden = YES;
    }
    
    if ([content respondsToSelector:@selector(rightActionButton)]) {
        self.rightActionButton = [content rightActionButton];
    } else {
        self.rightActionButton = nil;
    }
    
}

@end