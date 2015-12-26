//
//  RDRaceInfoViewOutput.h
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RDRaceInfoViewOutput <NSObject>

/**
 @author alaija

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;

- (void)didTriggerRaceStartEvent;
- (void)didTriggerRaceStopEvent;

@end