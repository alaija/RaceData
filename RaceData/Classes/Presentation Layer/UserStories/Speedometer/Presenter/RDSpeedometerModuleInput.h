//
//  RDSpeedometerModuleInput.h
//  RaceData
//
//  Created by alaija on 09/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RDSpeedometerModuleInput <NSObject>

/**
 @author alaija

 Метод инициирует стартовую конфигурацию текущего модуля
 */
- (void)configureModule;

@end