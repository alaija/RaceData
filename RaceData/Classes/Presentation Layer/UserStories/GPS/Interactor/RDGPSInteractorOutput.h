//
//  RDGPSInteractorOutput.h
//  RaceData
//
//  Created by alaija on 01/02/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RDGPSInteractorOutput <NSObject>

- (void)signalQualityChanged:(NSUInteger)level;

@end