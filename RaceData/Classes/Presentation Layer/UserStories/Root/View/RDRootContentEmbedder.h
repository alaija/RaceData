//
//  RDRootContentEmbedder.h
//  RaceData
//
//  Created by Alan Kochev on 27/01/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

@import Foundation;

@protocol RDRootContent;

@protocol RDRootContentEmbedder <NSObject>

- (void)embedContent:(id<RDRootContent>)content;

@end
