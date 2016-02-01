//
//  RDGPSAssembly.h
//  RaceData
//
//  Created by alaija on 01/02/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import <RamblerTyphoonUtils/AssemblyCollector.h>

#import "RDEmbeddedContent.h"
#import "ModuleAssemblyBase.h"

/**
 @author alaija

 GPS module
 */
@interface RDGPSAssembly : ModuleAssemblyBase <RamblerInitialAssembly>

- (id<RDEmbeddedContent>)gpsContent;

@end