//
//  RDGPSRouterTests.m
//  RaceData
//
//  Created by alaija on 01/02/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RDGPSRouter.h"

@interface RDGPSRouterTests : XCTestCase

@property (strong, nonatomic) RDGPSRouter *router;

@end

@implementation RDGPSRouterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.router = [[RDGPSRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end