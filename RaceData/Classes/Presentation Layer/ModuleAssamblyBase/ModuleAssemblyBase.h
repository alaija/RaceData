//
//  ModuleAssemblyBase.h
//  RaceData
//
//  Created by Alan Kochev on 09/01/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@protocol ServiceComponents;

@interface ModuleAssemblyBase : TyphoonAssembly

@property (strong, nonatomic, readonly) TyphoonAssembly <ServiceComponents> *serviceComponents;

@end

