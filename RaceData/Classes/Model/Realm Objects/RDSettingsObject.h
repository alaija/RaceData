//
//  RDSettingsObject.h
//  RaceData
//
//  Created by Alan Kochev on 03/04/16.
//  Copyright © 2016 Pavel Panchenko. All rights reserved.
//

#import <Realm/Realm.h>

@interface RDSettingsObject : RLMObject

@property (nonatomic) double speedLimit;
@property (nonatomic) BOOL nightMode;

@end

RLM_ARRAY_TYPE(RDSettingsObject)
