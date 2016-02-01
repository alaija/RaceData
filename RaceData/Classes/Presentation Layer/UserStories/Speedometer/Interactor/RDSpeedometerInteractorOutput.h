//
//  RDSpeedometerInteractorOutput.h
//  RaceData
//
//  Created by alaija on 09/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol RDSpeedometerInteractorOutput <NSObject>

- (void)speedChanged:(CGFloat)speed;

@end