//
//  RDSettingsModuleInput.h
//  RaceData
//
//  Created by alaija on 03/04/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RDSettingsModuleInput <NSObject>

/**
 @author alaija

 Метод инициирует стартовую конфигурацию текущего модуля
 */
- (void)configureModule;

@end