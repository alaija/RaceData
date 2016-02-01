//
//  RDRootPresenterTests.m
//  RaceData
//
//  Created by alaija on 27/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RDRootPresenter.h"

#import "RDRootViewInput.h"
#import "RDRootInteractorInput.h"
#import "RDRootRouterInput.h"

@interface RDRootPresenterTests : XCTestCase

@property (strong, nonatomic) RDRootPresenter *presenter;

@property (strong, nonatomic) id mockInteractor;
@property (strong, nonatomic) id mockRouter;
@property (strong, nonatomic) id mockView;

@end

@implementation RDRootPresenterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.presenter = [[RDRootPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(RDRootInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(RDRootRouterInput));
    self.mockView = OCMProtocolMock(@protocol(RDRootViewInput));

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

#pragma mark - Тестирование методов RDRootModuleInput

#pragma mark - Тестирование методов RDRootViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

#pragma mark - Тестирование методов RDRootInteractorOutput

@end