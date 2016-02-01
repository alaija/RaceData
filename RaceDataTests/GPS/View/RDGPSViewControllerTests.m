//
//  RDGPSViewControllerTests.m
//  RaceData
//
//  Created by alaija on 01/02/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RDGPSViewController.h"

#import "RDGPSViewOutput.h"

@interface RDGPSViewControllerTests : XCTestCase

@property (strong, nonatomic) RDGPSViewController *controller;

@property (strong, nonatomic) id mockOutput;

@end

@implementation RDGPSViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.controller = [[RDGPSViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(RDGPSViewOutput));

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

#pragma mark - Тестирование методов RDGPSViewInput

@end