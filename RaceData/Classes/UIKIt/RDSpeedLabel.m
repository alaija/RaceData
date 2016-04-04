//
//  RDSpeedLabel.m
//  RaceData
//
//  Created by Alan Kochev on 24/02/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

#import "RDSpeedLabel.h"
#import "UIFont+RDFont.h"

@interface RDSpeedLabel ()

@property (nonatomic) BOOL isIndicator;

@end

@implementation RDSpeedLabel

- (instancetype)init
{
    return [self initWithTextSize:[UIFont defautFontSize]];
}

- (instancetype)initWithTextSize:(CGFloat)size
{
    return [self initWithTextSize:size isIndicator:YES];
}

- (instancetype)initWithTextSize:(CGFloat)size isIndicator:(BOOL)indicatorStyle;
{
    self = [super init];
    
    if (self) {
        _isIndicator = indicatorStyle;
        self.font = [UIFont fontWithName:@"MyriadPro-Cond" size:size];
        self.textColor = [UIColor colorWithRed:0.88 green:0.86 blue:1 alpha:1];
        
        self.highlightedTextColor = indicatorStyle ? [UIColor colorWithWhite:1. alpha:1] : [UIColor redColor];
        
        self.layer.shadowColor = [UIColor redColor].CGColor;
        self.layer.masksToBounds = NO;
        self.layer.shadowOffset = CGSizeMake(0., 0.);
        self.layer.shadowRadius = indicatorStyle ? 15. : 30.;
        self.layer.shadowOpacity = 0.;
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.layer.shadowPath = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        self.layer.shadowOpacity = _isIndicator ? 1. : 0.3;
    } else {
        self.layer.shadowOpacity = 0.;
    }
}

- (void)drawTextInRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (self.highlighted) {
        CGContextSetShadowWithColor(context, CGSizeZero, _isIndicator ? 2. : 5., self.highlightedTextColor.CGColor);

    }
    CGContextSaveGState(context);
    [super drawTextInRect:rect];
    CGContextRestoreGState(context);
    
}
@end
