//
//  SettingsServiceImplementation.m
//  RaceData
//
//  Created by Alan Kochev on 03/04/16.
//  Copyright © 2016 Pavel Panchenko. All rights reserved.
//

#import "SettingsServiceImplementation.h"

NSString *const RDSettingsDidUpdate = @"RDSettingsDidUpdate";

@implementation SettingsServiceImplementation

- (RDSettingsObject *)settings
{
    RDSettingsObject *settings = [[RDSettingsObject allObjects] lastObject];
    
    if (!settings) {
        [self updateSettingsWithTransactionBlock:NULL];
    }
    
    return settings;
}

- (void)updateSettingsWithTransactionBlock:(void (^)(RDSettingsObject *))transactionBlock
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    RDSettingsObject *settings = [[RDSettingsObject allObjects] lastObject];
    
    if (!settings) {
        settings = [RDSettingsObject new];
        [realm addObject:settings];
    }
    
    if (transactionBlock) {
        transactionBlock(settings);
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:RDSettingsDidUpdate object:nil];
    
    [realm commitWriteTransaction];
}


@end
