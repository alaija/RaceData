//
//  RDRaceInfoInteractorTests.m
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RDRaceInfoInteractor.h"

#import "RDRaceInfoInteractorOutput.h"

@interface RDRaceInfoInteractorTests : XCTestCase

@property (strong, nonatomic) RDRaceInfoInteractor *interactor;

@property (strong, nonatomic) id mockOutput;

@end

@implementation RDRaceInfoInteractorTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.interactor = [[RDRaceInfoInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(RDRaceInfoInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов RDRaceInfoInteractorInput

@end