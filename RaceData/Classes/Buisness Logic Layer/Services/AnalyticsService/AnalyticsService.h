//
//  AnalyticsService.h
//  RaceData
//
//  Created by Pavel on 26.03.16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ANALYTICS_CATEGORY_RACE_ACTIONS @"raceActions"
#define ANALYTICS_CATEGORY_UI_ACTIONS @"uiActions"
#define ANALYTICS_CATEGORY_SETTINGS_ACTIONS @"settingsAction"

@protocol AnalyticsService <NSObject>

- (void)trackPageName:(NSString*)pageName;
- (void)trackEventWithCategory:(NSString*)category action:(NSString*)action;
- (void)trackEventWithCategory:(NSString*)category action:(NSString*)action label:(NSString*)label;

@end
