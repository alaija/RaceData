//
//  RDSpeedometerInteractorTests.m
//  RaceData
//
//  Created by alaija on 09/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RDSpeedometerInteractor.h"

#import "RDSpeedometerInteractorOutput.h"

@interface RDSpeedometerInteractorTests : XCTestCase

@property (strong, nonatomic) RDSpeedometerInteractor *interactor;

@property (strong, nonatomic) id mockOutput;

@end

@implementation RDSpeedometerInteractorTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.interactor = [[RDSpeedometerInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(RDSpeedometerInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов RDSpeedometerInteractorInput

@end