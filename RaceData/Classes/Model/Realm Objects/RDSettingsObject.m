//
//  RDSettingsObject.m
//  RaceData
//
//  Created by Alan Kochev on 03/04/16.
//  Copyright © 2016 Pavel Panchenko. All rights reserved.
//

#import "RDSettingsObject.h"
#import "RLMObject+RaceData.h"

@implementation RDSettingsObject

+ (NSDictionary *)defaultPropertyValues
{
    NSMutableDictionary *defaults = [NSMutableDictionary dictionaryWithDictionary:[self generateDefaultPropertyValues]];
    defaults[NSStringFromSelector(@selector(speedLimit))] = @300;
    defaults[NSStringFromSelector(@selector(metric))] = @NO;
    
    return [defaults copy];
}

@end
