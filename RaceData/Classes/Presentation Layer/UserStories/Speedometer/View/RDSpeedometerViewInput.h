//
//  RDSpeedometerViewInput.h
//  RaceData
//
//  Created by alaija on 09/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RDSpeedometerViewInput <NSObject>

@property (nonatomic) CGFloat speedLimit;
@property (nonatomic) BOOL metricSystem;
@property (nonatomic) BOOL nightMode;

/**
 @author alaija

 Метод настраивает начальный стейт view
 */
- (void)setupInitialState;
- (void)updateSpeed:(CGFloat)speed;

@end