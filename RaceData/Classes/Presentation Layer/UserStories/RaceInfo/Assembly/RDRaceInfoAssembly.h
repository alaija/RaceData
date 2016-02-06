//
//  RDRaceInfoAssembly.h
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

#import "ModuleAssemblyBase.h"
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@protocol RDRootContent;
/**
 @author alaija

 RaceInfo module
 */
@interface RDRaceInfoAssembly : ModuleAssemblyBase <RamblerInitialAssembly>

- (id<RDRootContent>)raceInfoContent;

@end