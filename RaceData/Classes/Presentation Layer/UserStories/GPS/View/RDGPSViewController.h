//
//  RDGPSViewController.h
//  RaceData
//
//  Created by alaija on 01/02/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RDGPSViewInput.h"
#import "RDEmbeddedContent.h"

@protocol RDGPSViewOutput;

@interface RDGPSViewController : UIViewController <RDGPSViewInput, RDEmbeddedContent>

@property (nonatomic, strong) id<RDGPSViewOutput> output;

@end