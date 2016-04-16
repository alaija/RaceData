//
//  RDSpeedLmitView.m
//  RaceData
//
//  Created by Alan Kochev on 10/04/16.
//  Copyright © 2016 Pavel Panchenko. All rights reserved.
//

#import "RDSpeedLmitView.h"
#import <PureLayout/PureLayout.h>
#import "UIScreen+RDScreen.h"

@interface RDSpeedLmitView ()

@property (nonatomic, strong) UIImageView *canvasView;

@end

@implementation RDSpeedLmitView

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
    self.canvasView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"speedlimit"]];
    [self addSubview:self.canvasView];
    
    self.speedLabel = [UILabel new];
    self.speedLabel.font = [UIFont fontWithName:@"MyriadPro-Cond" size:[self fontSize]];
    self.speedLabel.textColor = [UIColor blackColor];
    
    [self addSubview:self.speedLabel];
    
    [NSLayoutConstraint autoSetIdentifier:@"RDOverSpeedView Constraints" forConstraints:^{
        [self.speedLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.speedLabel autoAlignAxis:ALAxisHorizontal
                      toSameAxisOfView:self
                            withOffset:self.speedLabel.font.ascender - self.speedLabel.font.capHeight];
        [self.canvasView autoPinEdgesToSuperviewEdges];
    }];
}

- (void)setSpeedLimit:(CGFloat)speedLimit
{
    self.speedLabel.text = [NSString stringWithFormat:@"%.f", speedLimit];
}

+ (CGFloat)layoutCenterOffset
{
    if ([UIScreen is35inch]) {
        return 105.;
    } else if ([UIScreen is4inch]) {
        return 115.;
    } else if ([UIScreen is47inch]) {
        return 135.;
    }
    
    return 150.;
}

+ (CGFloat)layoutWidth
{
    if ([UIScreen is35inch]) {
        return 70.;
    } else if ([UIScreen is4inch]) {
        return 80.;
    } else if ([UIScreen is47inch]) {
        return 90.;
    }
    
    return 100.;
}

- (CGFloat)fontSize
{
    if ([UIScreen is35inch]) {
        return 42.;
    } else if ([UIScreen is4inch]) {
        return 44.;
    } else if ([UIScreen is47inch]) {
        return 56.;
    }
    
    return 60.;
}

@end
