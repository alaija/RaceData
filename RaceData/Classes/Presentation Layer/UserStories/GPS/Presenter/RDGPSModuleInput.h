//
//  RDGPSModuleInput.h
//  RaceData
//
//  Created by alaija on 01/02/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RDGPSModuleInput <NSObject>

/**
 @author alaija

 Метод инициирует стартовую конфигурацию текущего модуля
 */
- (void)configureModule;

@end