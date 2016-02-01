//
//  RDSpeedometerViewOutput.h
//  RaceData
//
//  Created by alaija on 09/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RDSpeedometerViewOutput <NSObject>

/**
 @author alaija

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;

@end