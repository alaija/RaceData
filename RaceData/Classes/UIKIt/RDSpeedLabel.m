//
//  RDSpeedLabel.m
//  RaceData
//
//  Created by Alan Kochev on 24/02/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

#import "RDSpeedLabel.h"

@implementation RDSpeedLabel

- (instancetype)init
{
    return [self initWithTextSize:25];
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
    CGRect oldRect = self.bounds;
    self.layer.shadowPath = [UIBezierPath bezierPathWithOvalInRect:oldRect].CGPath;//CGRectInset(oldRect, -CGRectGetWidth(oldRect)*0.3/2, -CGRectGetHeight(oldRect)*0.3/2)].CGPath;
    
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
