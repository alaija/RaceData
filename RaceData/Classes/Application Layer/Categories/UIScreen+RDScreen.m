//
//  UIScreen+RDScreen.m
//  RaceData
//
//  Created by Alan Kochev on 13/03/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

#import "UIScreen+RDScreen.h"

@implementation UIScreen (RDScreen)

+ (BOOL)is35inch
{
    return [self height] == 480.;
}

+ (BOOL)is4inch
{
    return [self height] == 568.;
}

+ (BOOL)is47inch
{
    return [self height] == 667.;
}

+ (BOOL)is55inch
{
    return [self height] == 736.;
}

+ (CGFloat)height
{
    return [self mainScreen].bounds.size.height;
}

@end
