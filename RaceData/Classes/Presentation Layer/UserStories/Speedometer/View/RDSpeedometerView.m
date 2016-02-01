//
//  RDSpeedometerView.m
//  RaceData
//
//  Created by Alan Kochev on 09/01/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

#import "RDSpeedometerView.h"
#import "RDSpeedometerLayer.h"

@implementation RDSpeedometerView

+ (Class)layerClass
{
    return [RDSpeedometerLayer class];
}

- (void)setSpeed:(CGFloat)speed
{
    _speed = speed;
    
    [CATransaction begin];
    [CATransaction setAnimationDuration: 1.];
    ((RDSpeedometerLayer *)self.layer).pressure = (_speed > 140. ? 1 : _speed/140.);
    [CATransaction commit];
}


@end
