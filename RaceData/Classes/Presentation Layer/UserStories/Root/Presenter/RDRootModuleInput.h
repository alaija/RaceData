//
//  RDRootModuleInput.h
//  RaceData
//
//  Created by alaija on 27/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RDRootModuleInput <NSObject>

/**
 @author alaija

 Метод инициирует стартовую конфигурацию текущего модуля
 */
- (void)configureModule;

@end