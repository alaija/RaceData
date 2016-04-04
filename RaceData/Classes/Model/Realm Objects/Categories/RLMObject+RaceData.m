//
//  RLMObject+RaceData.m
//  RaceData
//
//  Created by Alan Kochev on 03/04/16.
//  Copyright © 2016 Pavel Panchenko. All rights reserved.
//

#import "RLMObject+RaceData.h"
#import <CoreGraphics/CGBase.h>
#import <objc/runtime.h>

@implementation RLMObject (RaceData)

+ (NSDictionary *)generateDefaultPropertyValues
{
    static NSCharacterSet *trimClassCharacters = nil;
    static NSArray *ignorePropertyNames = nil;
    
    if (!trimClassCharacters) {
        trimClassCharacters = [NSCharacterSet characterSetWithCharactersInString:@"@\""];
        ignorePropertyNames = @[ @"hash", @"superclass", @"description", @"debugDescription" ];
    }
    
    NSMutableDictionary *defaultValues = [NSMutableDictionary dictionary];
    
    Class currentClass = [self class];
    
    while (currentClass != [RLMObject class]) {
        unsigned int propertiesCount = 0;
        objc_property_t *propertyArray = class_copyPropertyList(currentClass, &propertiesCount);
        
        for (NSUInteger propertyIndex = 0; propertyIndex < propertiesCount; propertyIndex++) {
            objc_property_t property = propertyArray[propertyIndex];
            NSString *name = [[NSString alloc] initWithUTF8String:property_getName(property)];
            
            if ([ignorePropertyNames containsObject:name]) {
                continue;
            }
            
            unsigned int attributesCount = 0;
            objc_property_attribute_t *propertyAttributes = property_copyAttributeList(property, &attributesCount);
            
            for (NSUInteger attributeIndex = 0; attributeIndex < attributesCount; attributeIndex++ ) {
                if (propertyAttributes[attributeIndex].name[0] == 'T') {
                    const char *typeValue = propertyAttributes[attributeIndex].value;
                    NSString *typeValueString = [[[NSString alloc] initWithUTF8String:typeValue]
                                                 stringByTrimmingCharactersInSet:trimClassCharacters];
                    
                    if ([typeValueString isEqualToString:NSStringFromClass([NSString class])]) {
                        defaultValues[name] = [NSString string];
                        
                    } else if (!strcmp(typeValue, @encode(int))
                               || !strcmp(typeValue, @encode(NSInteger))
                               || !strcmp(typeValue, @encode(long))
                               || !strcmp(typeValue, @encode(long long))
                               || !strcmp(typeValue, @encode(float))
                               || !strcmp(typeValue, @encode(double))
                               || !strcmp(typeValue, @encode(CGFloat))) {
                        defaultValues[name] = @0;
                        
                    } else if (strcmp(typeValue, @encode(BOOL)) == 0 || strcmp(typeValue, @encode(bool)) == 0) {
                        defaultValues[name] = @NO;
                        
                    } else if ([typeValueString isEqualToString:NSStringFromClass([NSDate class])]) {
                        defaultValues[name] = [NSDate dateWithTimeIntervalSince1970:0.0];
                        
                    } else if ([typeValueString isEqualToString:NSStringFromClass([NSData class])]) {
                        defaultValues[name] = [[NSData alloc] init];
                    }
                }
            }
            
            free(propertyAttributes);
        }
        
        free(propertyArray);
        currentClass = [currentClass superclass];
        
    };
    
    return [defaultValues copy];
}
@end
