//
//  RDGPSPresenterTests.m
//  RaceData
//
//  Created by alaija on 01/02/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RDGPSPresenter.h"

#import "RDGPSViewInput.h"
#import "RDGPSInteractorInput.h"
#import "RDGPSRouterInput.h"

@interface RDGPSPresenterTests : XCTestCase

@property (strong, nonatomic) RDGPSPresenter *presenter;

@property (strong, nonatomic) id mockInteractor;
@property (strong, nonatomic) id mockRouter;
@property (strong, nonatomic) id mockView;

@end

@implementation RDGPSPresenterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.presenter = [[RDGPSPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(RDGPSInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(RDGPSRouterInput));
    self.mockView = OCMProtocolMock(@protocol(RDGPSViewInput));

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

#pragma mark - Тестирование методов RDGPSModuleInput

#pragma mark - Тестирование методов RDGPSViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

#pragma mark - Тестирование методов RDGPSInteractorOutput

@end