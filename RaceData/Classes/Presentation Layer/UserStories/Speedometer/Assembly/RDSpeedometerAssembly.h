//
//  RDSpeedometerAssembly.h
//  RaceData
//
//  Created by alaija on 09/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "ModuleAssemblyBase.h"
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@protocol RDRootContent;
/**
 @author alaija

 Speedometer module
 */
@interface RDSpeedometerAssembly : ModuleAssemblyBase <RamblerInitialAssembly>

- (id<RDRootContent>)speedometerContent;

@end