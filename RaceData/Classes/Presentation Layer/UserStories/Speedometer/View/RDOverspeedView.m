//
//  RDOverspeedView.m
//  RaceData
//
//  Created by Alan Kochev on 10/04/16.
//  Copyright © 2016 Pavel Panchenko. All rights reserved.
//

#import "RDOverspeedView.h"
#import <PureLayout/PureLayout.h>
#import "UIFont+RDFont.h"
#import "UIScreen+RDScreen.h"

@interface RDOverspeedView ()

@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation RDOverspeedView

@synthesize animate = _animate;

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI
{
    self.textLabel = [UILabel new];
    [self.textLabel setText:[NSLocalizedString(@"Превышение скорости!", nil) uppercaseString]];
    self.textLabel.font = [UIFont fontWithName:@"MyriadPro-Cond" size:28.];
    self.textLabel.textColor = [UIColor whiteColor];
    
    [self addSubview:self.textLabel];
    
    [NSLayoutConstraint autoSetIdentifier:@"RDOverSpeedView Constraints" forConstraints:^{
        [self.textLabel autoCenterInSuperview];
    }];
    
    self.backgroundColor = [UIColor redColor];
    
    self.layer.cornerRadius = 10;
    self.layer.shadowColor = [UIColor redColor].CGColor;
    self.layer.masksToBounds = NO;
    self.layer.shadowOffset = CGSizeMake(0., 0.);
    self.layer.shadowRadius =  15.;
    self.layer.shadowOpacity = 1.;
}

- (void)setAnimate:(BOOL)animate
{
    if (_animate != animate) {
        _animate = animate;
        [self.layer removeAllAnimations];
        
        if (animate) {
            [self startAnimation];
        } else {
            [self setHidden:YES];
        }
    }
}

- (void)startAnimation {
    
    [self setAlpha:0.];
    [self setHidden:NO];
    
    if (_animate) {
    [UIView animateWithDuration:0.2
                          delay:0.5
                        options:0
                     animations:^{
                         
                         [self setAlpha:1.];
                         
                     } completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:0.2
                                               delay:1.
                                             options:0
                                          animations:^{
                                              
                                              [self setAlpha:0.];
                                              
                                          } completion:^(BOOL finished) {
                                              [self startAnimation];
                                          }];
                         
                     }];
    }
}

+ (CGFloat)layoutTopInset
{
    if ([UIScreen is35inch]) {
        return 55.;
    } else if ([UIScreen is4inch]) {
        return 75.;
    } else if ([UIScreen is47inch]) {
        return 90.;
    }
    
    return 100.;
}

@end
