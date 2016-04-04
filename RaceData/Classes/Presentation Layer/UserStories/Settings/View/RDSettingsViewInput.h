//
//  RDSettingsViewInput.h
//  RaceData
//
//  Created by alaija on 03/04/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RDSettingsViewInput <NSObject>

/**
 @author alaija

 Метод настраивает начальный стейт view
 */
- (void)setupInitialState;

@end