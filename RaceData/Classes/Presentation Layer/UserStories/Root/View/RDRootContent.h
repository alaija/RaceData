//
//  RDRootContent.h
//  RaceData
//
//  Created by Alan Kochev on 27/01/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

@import UIKit;

#import "RDEmbeddedContent.h"

@protocol RDRootContent <RDEmbeddedContent>

@optional

- (UIButton *)leftActionButton;
- (UIButton *)rightActionButton;

@end
