//
//  RDSpeedometerViewControllerTests.m
//  RaceData
//
//  Created by alaija on 09/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RDSpeedometerViewController.h"

#import "RDSpeedometerViewOutput.h"

@interface RDSpeedometerViewControllerTests : XCTestCase

@property (strong, nonatomic) RDSpeedometerViewController *controller;

@property (strong, nonatomic) id mockOutput;

@end

@implementation RDSpeedometerViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.controller = [[RDSpeedometerViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(RDSpeedometerViewOutput));

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

#pragma mark - Тестирование методов RDSpeedometerViewInput

@end