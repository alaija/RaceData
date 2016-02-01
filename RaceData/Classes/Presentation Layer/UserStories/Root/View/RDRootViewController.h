//
//  RDRootViewController.h
//  RaceData
//
//  Created by alaija on 27/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RDRootViewInput.h"
#import "RDRootContentEmbedder.h"

@protocol RDRootViewOutput;

@interface RDRootViewController : UIViewController <RDRootViewInput, RDRootContentEmbedder>

@property (nonatomic, strong) id<RDRootViewOutput> output;

@property (weak, nonatomic) IBOutlet UIView *contentContainerView;

@property (weak, nonatomic) IBOutlet UIButton *leftNavigationButton;
@property (weak, nonatomic) IBOutlet UIButton *rightNavigationButton;
@property (weak, nonatomic) IBOutlet UIButton *leftActionButton;
@property (weak, nonatomic) IBOutlet UIButton *rightActionButton;

@end