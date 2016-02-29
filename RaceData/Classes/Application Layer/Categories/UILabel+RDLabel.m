//
//  UILabel+RDLabel.m
//  RaceData
//
//  Created by Alan Kochev on 29/02/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

#import "UILabel+RDLabel.h"

@implementation UILabel (RDLabel)

+ (void) setupLabelAsDefault:(UILabel *)label
{
    label.font = [UIFont fontWithName:@"MyriadPro-Cond" size:25.];
    label.textColor = [UIColor colorWithRed:0.88 green:0.86 blue:1 alpha:1];
}

@end
