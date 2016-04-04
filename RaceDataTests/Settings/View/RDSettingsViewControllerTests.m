//
//  RDSettingsViewControllerTests.m
//  RaceData
//
//  Created by alaija on 03/04/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RDSettingsViewController.h"

#import "RDSettingsViewOutput.h"

@interface RDSettingsViewControllerTests : XCTestCase

@property (strong, nonatomic) RDSettingsViewController *controller;

@property (strong, nonatomic) id mockOutput;

@end

@implementation RDSettingsViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.controller = [[RDSettingsViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(RDSettingsViewOutput));

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

#pragma mark - Тестирование методов RDSettingsViewInput

@end