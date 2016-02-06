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
        self.contentContainerView.transform = CGAffineTransformMakeScale(1., 1.);
    } else {
        self.contentContainerView.transform = CGAffineTransformMakeScale(1., -1.);
    }
    _hudded = !_hudded;
    [UIViewController attemptRotationToDeviceOrientation];
}


- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (BOOL)shouldAutorotate
{
    return !_hudded;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)configureAsHUDButton:(UIButton *)button
{
    if (button) {
        [button setTitle:@"HUD" forState:UIControlStateNormal];
        [button removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
        [button addTarget:self action:@selector(toogleHudded) forControlEvents:UIControlEventTouchUpInside];
        button.hidden = NO;
    }
}

- (void)configureAsNavigationButton:(UIButton *)button withIdentifier:(NSString *)identifier
{
    if (button && identifier.length > 0) {
        [button setImage:[UIImage imageNamed:([identifier
                                               isEqualToString:@"Speedometer"]
                                              ? @"race"
                                              : @"speedometer")]
                forState:UIControlStateNormal];
        
        [button removeTarget:nil action:NULL
            forControlEvents:UIControlEventAllEvents];
        
        [button addTarget:self action:@selector(leftNavigationAcction:)
         forControlEvents:UIControlEventTouchUpInside];
        button.hidden = NO;
    }
}

- (void)configureButton:(UIButton *)button withSourceButton:(UIButton *)sourceButton
{
    if (button && sourceButton) {
        [button removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
        
        NSString *actionSelector = [[sourceButton actionsForTarget:self.currentContentViewController
                                                   forControlEvent:UIControlEventTouchUpInside] firstObject];
        
        [button addTarget:self.currentContentViewController
                   action:NSSelectorFromString(actionSelector)
         forControlEvents:UIControlEventTouchUpInside];
        
        [button setTitle:[sourceButton titleForState:UIControlStateNormal] forState:UIControlStateNormal];
        [button setTitle:[sourceButton titleForState:UIControlStateSelected] forState:UIControlStateSelected];
        [button setTitle:[sourceButton titleForState:UIControlStateHighlighted] forState:UIControlStateHighlighted];
        [button setTitle:[sourceButton titleForState:UIControlStateDisabled] forState:UIControlStateDisabled];
        
        [button setImage:[sourceButton imageForState:UIControlStateNormal] forState:UIControlStateNormal];
        [button setImage:[sourceButton imageForState:UIControlStateSelected] forState:UIControlStateSelected];
        [button setImage:[sourceButton imageForState:UIControlStateHighlighted] forState:UIControlStateHighlighted];
        [button setImage:[sourceButton imageForState:UIControlStateDisabled] forState:UIControlStateDisabled];
        
        button.hidden = NO;
    }
}

- (IBAction)leftNavigationAcction:(id)sender
{
    [self.output navigateFromViewWithIdentifier:self.currentContentViewController.restorationIdentifier];
}

- (IBAction)rightNavigationAcction:(id)sender
{
    [self.output showSettings];
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
    [self.leftNavigationButton setContentMode:UIViewContentModeScaleAspectFit];
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
    

    [self configureAsNavigationButton:self.leftNavigationButton withIdentifier:controller.restorationIdentifier];

    self.rightNavigationButton.hidden = YES;
    
    if ([content respondsToSelector:@selector(leftActionButton)]) {
        [self configureButton:self.leftActionButton
             withSourceButton:[content leftActionButton]];
    } else if (contentCanBeHudded) {
        [self configureAsHUDButton:self.leftActionButton];;
    } else {
        self.leftActionButton.hidden = YES;
    }
    
    if ([content respondsToSelector:@selector(rightActionButton)]) {
        [self configureButton:self.rightActionButton
             withSourceButton:[content rightActionButton]];
    } else {
        self.rightActionButton.hidden = YES;
    }
}

@end