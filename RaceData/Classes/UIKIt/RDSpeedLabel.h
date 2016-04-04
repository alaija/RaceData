//
//  RDSpeedLabel.h
//  RaceData
//
//  Created by Alan Kochev on 24/02/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RDSpeedLabel : UILabel

- (instancetype)initWithTextSize:(CGFloat)size;
- (instancetype)initWithTextSize:(CGFloat)size isIndicator:(BOOL)indicatorStyle;

@end
