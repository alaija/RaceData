//
//  RDSpeedometerViewController.h
//  RaceData
//
//  Created by alaija on 09/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RDSpeedometerViewInput.h"
#import "RDRootContent.h"

@protocol RDSpeedometerViewOutput;

@interface RDSpeedometerViewController : UIViewController <RDSpeedometerViewInput, RDRootContent>

@property (nonatomic, strong) id<RDSpeedometerViewOutput> output;

@end