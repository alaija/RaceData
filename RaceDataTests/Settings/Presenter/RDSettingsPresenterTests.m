//
//  RDSettingsPresenterTests.m
//  RaceData
//
//  Created by alaija on 03/04/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RDSettingsPresenter.h"

#import "RDSettingsViewInput.h"
#import "RDSettingsInteractorInput.h"
#import "RDSettingsRouterInput.h"

@interface RDSettingsPresenterTests : XCTestCase

@property (strong, nonatomic) RDSettingsPresenter *presenter;

@property (strong, nonatomic) id mockInteractor;
@property (strong, nonatomic) id mockRouter;
@property (strong, nonatomic) id mockView;

@end

@implementation RDSettingsPresenterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.presenter = [[RDSettingsPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(RDSettingsInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(RDSettingsRouterInput));
    self.mockView = OCMProtocolMock(@protocol(RDSettingsViewInput));

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

#pragma mark - Тестирование методов RDSettingsModuleInput

#pragma mark - Тестирование методов RDSettingsViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

#pragma mark - Тестирование методов RDSettingsInteractorOutput

@end