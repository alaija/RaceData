//
//  RDSpeedLmitView.h
//  RaceData
//
//  Created by Alan Kochev on 10/04/16.
//  Copyright © 2016 Pavel Panchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RDSpeedLmitView : UIView

@property (nonatomic, strong) UILabel *speedLabel;
@property (nonatomic) CGFloat speedLimit;

+ (CGFloat)layoutCenterOffset;
+ (CGFloat)layoutWidth;

@end
