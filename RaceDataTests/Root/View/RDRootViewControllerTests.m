//
//  RDRootViewControllerTests.m
//  RaceData
//
//  Created by alaija on 27/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RDRootViewController.h"

#import "RDRootViewOutput.h"

@interface RDRootViewControllerTests : XCTestCase

@property (strong, nonatomic) RDRootViewController *controller;

@property (strong, nonatomic) id mockOutput;

@end

@implementation RDRootViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.controller = [[RDRootViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(RDRootViewOutput));

    self.controller.output = self.mockOutput;
}

- (void)tearDown {
    self.controller = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование жизненного цикла

- (void)testThatViewNotifiesPresenterOnDidLoad {
	// given

	// when
	[self.controller viewDidLoad];

	// then
	OCMVerify([self.mockOutput didTriggerViewReadyEvent]);
}

#pragma mark - Тестирование методов интерфейса

#pragma mark - Тестирование методов RDRootViewInput

@end