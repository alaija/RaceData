//
//  RDGPSViewInput.h
//  RaceData
//
//  Created by alaija on 01/02/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RDGPSViewInput <NSObject>

/**
 @author alaija

 Метод настраивает начальный стейт view
 */
- (void)setupInitialState;
- (void)updateSignalQualityLevel:(NSUInteger)level;

@end