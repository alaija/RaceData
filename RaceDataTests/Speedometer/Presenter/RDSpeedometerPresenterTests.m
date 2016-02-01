//
//  RDSpeedometerPresenterTests.m
//  RaceData
//
//  Created by alaija on 09/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RDSpeedometerPresenter.h"

#import "RDSpeedometerViewInput.h"
#import "RDSpeedometerInteractorInput.h"
#import "RDSpeedometerRouterInput.h"

@interface RDSpeedometerPresenterTests : XCTestCase

@property (strong, nonatomic) RDSpeedometerPresenter *presenter;

@property (strong, nonatomic) id mockInteractor;
@property (strong, nonatomic) id mockRouter;
@property (strong, nonatomic) id mockView;

@end

@implementation RDSpeedometerPresenterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.presenter = [[RDSpeedometerPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(RDSpeedometerInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(RDSpeedometerRouterInput));
    self.mockView = OCMProtocolMock(@protocol(RDSpeedometerViewInput));

    self.presenter.interactor = self.mockInteractor;
    self.presenter.router = self.mockRouter;
    self.presenter.view = self.mockView;
}

- (void)tearDown {
    self.presenter = nil;

    self.mockView = nil;
    self.mockRouter = nil;
    self.mockInteractor = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов RDSpeedometerModuleInput

#pragma mark - Тестирование методов RDSpeedometerViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

#pragma mark - Тестирование методов RDSpeedometerInteractorOutput

@end