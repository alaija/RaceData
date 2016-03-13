//
//  UIFont+RDFont.m
//  RaceData
//
//  Created by Alan Kochev on 13/03/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

#import "UIFont+RDFont.h"
#import "UIScreen+RDScreen.h"

@implementation UIFont (RDFont)

+ (CGFloat)defautFontSize
{
    CGFloat size = 25.;
    
    if ([UIScreen is35inch]) {
        size = 18.;
    } else if ([UIScreen is4inch]) {
        size = 20.;
    } else if ([UIScreen is47inch]) {
        size = 23.;
    }
    
    return size;
}

+ (CGFloat)bigFontSize
{
    CGFloat size = 120.;
    
    if ([UIScreen is35inch]) {
        size = 85.;
    } else if ([UIScreen is4inch]) {
        size = 90.;
    } else if ([UIScreen is47inch]) {
        size = 110.;
    }
    
    return size;
}

+ (UIFont *)defaultFont
{
    return [UIFont fontWithName:@"MyriadPro-Cond" size:[self defautFontSize]];
}

@end
