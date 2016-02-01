//
//  RDSpeedometerLayer.m
//  RaceData
//
//  Created by Alan Kochev on 16/01/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

#import "RDSpeedometerLayer.h"
#import "RDStyleKit.h"

@implementation RDSpeedometerLayer

@dynamic pressure;

- (instancetype)init
{
    if (self = [super init]) {
        self.pressure = 0.5;
    }
    
    return self;
}

- (instancetype)initWithLayer:(id)layer
{
    if ((self = [super initWithLayer: layer])) {
        
        if ([layer isKindOfClass: RDSpeedometerLayer.class]) {
            self.pressure = ((RDSpeedometerLayer *)layer).pressure;
        }
    }
    
    return self;
}

+ (BOOL)needsDisplayForKey:(NSString*)key
{
    if([key isEqualToString: @"pressure"]) {
        return YES;
    }
    
    return [super needsDisplayForKey: key];
}

- (id<CAAction>)actionForKey:(NSString *)event
{
    if([event isEqualToString: @"pressure"]) {
        CABasicAnimation *theAnimation = [CABasicAnimation animationWithKeyPath: event];
        theAnimation.fromValue = [self valueForKey: event];
        
        return theAnimation;
    }
    
    return [super actionForKey: event];
}

- (void)drawInContext:(CGContextRef)ctx
{
    UIGraphicsPushContext(ctx);
    [RDStyleKit drawDayModeSpeedometerWithFrame2:(CGRect){ CGPointZero, self.frame.size}
                                      fillColor:[UIColor blackColor]
                                       pressure:self.pressure];
    UIGraphicsPopContext();
}

@end
