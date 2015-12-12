//
//  RDRaceInfoModuleInput.h
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RDRaceInfoModuleInput <NSObject>

/**
 @author alaija

 Метод инициирует стартовую конфигурацию текущего модуля
 */
- (void)configureModule;

@end