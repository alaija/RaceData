//
//  RDRaceInfoRouterTests.m
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RDRaceInfoRouter.h"

@interface RDRaceInfoRouterTests : XCTestCase

@property (strong, nonatomic) RDRaceInfoRouter *router;

@end

@implementation RDRaceInfoRouterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.router = [[RDRaceInfoRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end