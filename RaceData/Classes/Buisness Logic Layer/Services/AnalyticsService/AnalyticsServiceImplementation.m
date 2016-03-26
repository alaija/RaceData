//
//  AnalyticsServiceImplementation.m
//  RaceData
//
//  Created by Pavel on 26.03.16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

#import "AnalyticsServiceImplementation.h"
#import <Google/Analytics.h>

@implementation AnalyticsServiceImplementation

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        // Configure tracker from GoogleService-Info.plist.
        NSError *configureError;
        [[GGLContext sharedInstance] configureWithError:&configureError];
        NSAssert(!configureError, @"Error configuring Google services: %@", configureError);
        
        // Optional: configure GAI options.
        GAI *gai = [GAI sharedInstance];
        gai.trackUncaughtExceptions = NO;  // report uncaught exceptions
        //gai.logger.logLevel = kGAILogLevelVerbose;  // remove before app release
        
        BOOL enableTracking = [[[NSBundle mainBundle] objectForInfoDictionaryKey:@"RDEnableGoogleAnalytics"] boolValue];
        [gai setDryRun:!enableTracking];
    }
    
    return self;
}

#pragma mark - Tracking

- (void)trackPageName:(NSString*)pageName
{
    [[GAI sharedInstance].defaultTracker set:kGAIScreenName value:pageName];
    [[GAI sharedInstance].defaultTracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

- (void)trackEventWithCategory:(NSString*)category action:(NSString*)action
{
    [self trackEventWithCategory:category action:action label:nil];
}

- (void)trackEventWithCategory:(NSString*)category action:(NSString*)action label:(NSString*)label
{
    NSMutableDictionary *event = [[GAIDictionaryBuilder createEventWithCategory:category
                                                                         action:action
                                                                          label:label
                                                                          value:nil] build];
    [[GAI sharedInstance].defaultTracker send:event];
}

@end
