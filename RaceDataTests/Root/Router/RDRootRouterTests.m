//
//  RDRootRouterTests.m
//  RaceData
//
//  Created by alaija on 27/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RDRootRouter.h"

@interface RDRootRouterTests : XCTestCase

@property (strong, nonatomic) RDRootRouter *router;

@end

@implementation RDRootRouterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.router = [[RDRootRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end