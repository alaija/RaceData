//
//  SettingsService.h
//  RaceData
//
//  Created by Alan Kochev on 03/04/16.
//  Copyright © 2016 Pavel Panchenko. All rights reserved.
//

#import "RDSettingsObject.h"

@protocol SettingsService <NSObject>

@property (nonatomic) RDSettingsObject * settings;

- (void)updateSettingsWithTransactionBlock:(void(^)(RDSettingsObject *settingsObject))transactionBlock;

@end
