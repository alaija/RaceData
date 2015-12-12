//
//  RDRaceInfoViewControllerTests.m
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RDRaceInfoViewController.h"

#import "RDRaceInfoViewOutput.h"

@interface RDRaceInfoViewControllerTests : XCTestCase

@property (strong, nonatomic) RDRaceInfoViewController *controller;

@property (strong, nonatomic) id mockOutput;

@end

@implementation RDRaceInfoViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.controller = [[RDRaceInfoViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(RDRaceInfoViewOutput));

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

#pragma mark - Тестирование методов RDRaceInfoViewInput

@end