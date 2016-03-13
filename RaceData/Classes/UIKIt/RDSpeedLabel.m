//
//  RDSpeedLabel.m
//  RaceData
//
//  Created by Alan Kochev on 24/02/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

#import "RDSpeedLabel.h"
#import "UIFont+RDFont.h"

@implementation RDSpeedLabel

- (instancetype)init
{
    return [self initWithTextSize:[UIFont defautFontSize]];
}

- (instancetype)initWithTextSize:(CGFloat)size
{
    self = [super init];
    
    if (self) {
        self.font = [UIFont fontWithName:@"MyriadPro-Cond" size:size];
        self.textColor = [UIColor colorWithRed:0.88 green:0.86 blue:1 alpha:1];
        self.highlightedTextColor = [UIColor colorWithWhite:1. alpha:1];
        
        self.layer.shadowColor = [UIColor redColor].CGColor;
        self.layer.masksToBounds = NO;
        self.layer.shadowOffset = CGSizeMake(0., 0.);
        self.layer.shadowRadius = 15.;
        self.layer.shadowOpacity = 0.;
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.layer.shadowPath = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        self.layer.shadowOpacity = 1.;
    } else {
        self.layer.shadowOpacity = 0.;
    }
}

@end
