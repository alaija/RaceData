//
//  RDRootInteractorTests.m
//  RaceData
//
//  Created by alaija on 27/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RDRootInteractor.h"

#import "RDRootInteractorOutput.h"

@interface RDRootInteractorTests : XCTestCase

@property (strong, nonatomic) RDRootInteractor *interactor;

@property (strong, nonatomic) id mockOutput;

@end

@implementation RDRootInteractorTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.interactor = [[RDRootInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(RDRootInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов RDRootInteractorInput

@end