//
//  ServiceComponentsAssembly.h
//  RaceData
//
//  Created by Alan Kochev on 09/01/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import <RamblerTyphoonUtils/AssemblyCollector.h>
#import "ServiceComponents.h"
#import "TyphoonAssembly.h"

@interface ServiceComponentsAssembly : TyphoonAssembly <ServiceComponents, RamblerInitialAssembly>

@end