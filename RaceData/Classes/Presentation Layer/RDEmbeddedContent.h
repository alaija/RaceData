//
//  RDEmbeddedContent.h
//  RaceData
//
//  Created by Alan Kochev on 01/02/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

@protocol RDEmbeddedContent <NSObject>

@property (nonatomic) BOOL nightMode;

- (UIViewController *)viewController;
- (BOOL)canBeHudded;

@end

