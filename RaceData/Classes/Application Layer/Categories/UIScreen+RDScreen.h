//
//  UIScreen+RDScreen.h
//  RaceData
//
//  Created by Alan Kochev on 13/03/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (RDScreen)

+ (BOOL)is35inch;
+ (BOOL)is4inch;
+ (BOOL)is47inch;
+ (BOOL)is55inch;

+ (CGFloat)height;

@end
