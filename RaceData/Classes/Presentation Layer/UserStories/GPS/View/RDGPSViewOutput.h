//
//  RDGPSViewOutput.h
//  RaceData
//
//  Created by alaija on 01/02/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RDGPSViewOutput <NSObject>

/**
 @author alaija

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;

@end