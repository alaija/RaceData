//
//  RDSettingsViewOutput.h
//  RaceData
//
//  Created by alaija on 03/04/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RDSettingsViewOutput <NSObject>

/**
 @author alaija

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;

@end