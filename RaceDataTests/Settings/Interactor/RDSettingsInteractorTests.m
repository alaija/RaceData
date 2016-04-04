//
//  RDSettingsInteractorTests.m
//  RaceData
//
//  Created by alaija on 03/04/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RDSettingsInteractor.h"

#import "RDSettingsInteractorOutput.h"

@interface RDSettingsInteractorTests : XCTestCase

@property (strong, nonatomic) RDSettingsInteractor *interactor;

@property (strong, nonatomic) id mockOutput;

@end

@implementation RDSettingsInteractorTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.interactor = [[RDSettingsInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(RDSettingsInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов RDSettingsInteractorInput

@end