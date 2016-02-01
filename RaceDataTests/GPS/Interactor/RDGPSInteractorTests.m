//
//  RDGPSInteractorTests.m
//  RaceData
//
//  Created by alaija on 01/02/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RDGPSInteractor.h"

#import "RDGPSInteractorOutput.h"

@interface RDGPSInteractorTests : XCTestCase

@property (strong, nonatomic) RDGPSInteractor *interactor;

@property (strong, nonatomic) id mockOutput;

@end

@implementation RDGPSInteractorTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.interactor = [[RDGPSInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(RDGPSInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов RDGPSInteractorInput

@end