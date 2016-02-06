//
//  RDRaceInfoViewController.h
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RDRaceInfoViewInput.h"
#import "RDRootContent.h"

@protocol RDRaceInfoViewOutput;

@interface RDRaceInfoViewController : UIViewController <RDRaceInfoViewInput, RDRootContent>

@property (nonatomic, strong) id<RDRaceInfoViewOutput> output;

@end