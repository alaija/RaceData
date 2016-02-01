//
//  RDSpeedometerRouterTests.m
//  RaceData
//
//  Created by alaija on 09/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RDSpeedometerRouter.h"

@interface RDSpeedometerRouterTests : XCTestCase

@property (strong, nonatomic) RDSpeedometerRouter *router;

@end

@implementation RDSpeedometerRouterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.router = [[RDSpeedometerRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end