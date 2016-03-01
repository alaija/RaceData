//
//  AppDelegate.m
//  RaceData
//
//  Created by Alan Kochev on 12/12/15.
//  Copyright © 2015 Alan Kochev. All rights reserved.
//

#import "AppDelegate.h"
#import "AssemblyCollector.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [application setIdleTimerDisabled:NO];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [application setIdleTimerDisabled:YES];
}

- (NSArray *)initialAssemblies
{
    RamblerInitialAssemblyCollector *collector = [RamblerInitialAssemblyCollector new];
    return [collector collectInitialAssemblyClasses];
}

@end
