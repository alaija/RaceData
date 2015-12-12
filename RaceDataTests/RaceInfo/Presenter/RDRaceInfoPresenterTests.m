//
//  RDRaceInfoPresenterTests.m
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RDRaceInfoPresenter.h"

#import "RDRaceInfoViewInput.h"
#import "RDRaceInfoInteractorInput.h"
#import "RDRaceInfoRouterInput.h"

@interface RDRaceInfoPresenterTests : XCTestCase

@property (strong, nonatomic) RDRaceInfoPresenter *presenter;

@property (strong, nonatomic) id mockInteractor;
@property (strong, nonatomic) id mockRouter;
@property (strong, nonatomic) id mockView;

@end

@implementation RDRaceInfoPresenterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.presenter = [[RDRaceInfoPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(RDRaceInfoInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(RDRaceInfoRouterInput));
    self.mockView = OCMProtocolMock(@protocol(RDRaceInfoViewInput));

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

#pragma mark - Тестирование методов RDRaceInfoModuleInput

#pragma mark - Тестирование методов RDRaceInfoViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

#pragma mark - Тестирование методов RDRaceInfoInteractorOutput

@end