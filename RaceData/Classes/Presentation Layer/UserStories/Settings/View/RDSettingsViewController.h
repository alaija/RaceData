//
//  RDSettingsViewController.h
//  RaceData
//
//  Created by alaija on 03/04/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RDSettingsViewInput.h"

@protocol RDSettingsViewOutput;

@interface RDSettingsViewController : UIViewController <RDSettingsViewInput>

@property (nonatomic, strong) id<RDSettingsViewOutput> output;

@end