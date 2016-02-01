//
//  MotionService.h
//  RaceData
//
//  Created by Alan Kochev on 09/01/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MotionService <NSObject>

@property (nonatomic, readonly) CGFloat currentAcceleration;

- (void)startUpdates;
- (void)stopUpdates;

@end