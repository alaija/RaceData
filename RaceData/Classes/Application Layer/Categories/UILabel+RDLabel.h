//
//  UILabel+RDLabel.h
//  RaceData
//
//  Created by Alan Kochev on 29/02/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (RDLabel)

+ (void)setupLabelAsDefault:(UILabel *)label;
+ (void)setupLabelAsLight:(UILabel *)label;

@end
