//
//  RDSettingsRouterTests.m
//  RaceData
//
//  Created by alaija on 03/04/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RDSettingsRouter.h"

@interface RDSettingsRouterTests : XCTestCase

@property (strong, nonatomic) RDSettingsRouter *router;

@end

@implementation RDSettingsRouterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.router = [[RDSettingsRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end