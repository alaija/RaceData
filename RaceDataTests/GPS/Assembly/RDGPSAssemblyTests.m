//
//  RDGPSAssemblyTests.m
//  RaceData
//
//  Created by alaija on 01/02/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <RamblerTyphoonUtils/AssemblyTesting.h>
#import <Typhoon/Typhoon.h>

#import "RDGPSAssembly.h"
#import "RDGPSAssembly_Testable.h"

#import "RDGPSViewController.h"
#import "RDGPSPresenter.h"
#import "RDGPSInteractor.h"
#import "RDGPSRouter.h"

@interface RDGPSAssemblyTests : RamblerTyphoonAssemblyTests

@property (strong, nonatomic) RDGPSAssembly *assembly;

@end

@implementation RDGPSAssemblyTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.assembly = [[RDGPSAssembly alloc] init];
    [self.assembly activate];
}

- (void)tearDown {
    self.assembly = nil;

    [super tearDown];
}

#pragma mark - Тестирование создания элементов модуля

- (void)testThatAssemblyCreatesViewController {
    // given
    Class targetClass = [RDGPSViewController class];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    // when
    id result = [self.assembly viewGPSModule];

    // then
    [self verifyTargetDependency:result
                       withClass:targetClass
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesPresenter {
    // given
    Class targetClass = [RDGPSPresenter class];
    NSArray *dependencies = @[
                              RamblerSelector(interactor),
                              RamblerSelector(view),
                              RamblerSelector(router)
                              ];
    // when
    id result = [self.assembly presenterGPSModule];

    // then
    [self verifyTargetDependency:result
                       withClass:targetClass
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesInteractor {
    // given
    Class targetClass = [RDGPSInteractor class];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    // when
    id result = [self.assembly interactorGPSModule];

    // then
    [self verifyTargetDependency:result
                       withClass:targetClass
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesRouter {
    // given
    Class targetClass = [RDGPSRouter class];
    NSArray *dependencies = @[
                              RamblerSelector(transitionHandler)
                              ];
    // when
    id result = [self.assembly routerGPSModule];

    // then
    [self verifyTargetDependency:result
                       withClass:targetClass
                    dependencies:dependencies];
}

@end