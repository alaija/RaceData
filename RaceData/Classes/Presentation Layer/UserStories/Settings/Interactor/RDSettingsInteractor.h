//
//  RDSettingsInteractor.h
//  RaceData
//
//  Created by alaija on 03/04/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDSettingsInteractorInput.h"

@protocol RDSettingsInteractorOutput;

@interface RDSettingsInteractor : NSObject <RDSettingsInteractorInput>

@property (nonatomic, weak) id<RDSettingsInteractorOutput> output;

@end