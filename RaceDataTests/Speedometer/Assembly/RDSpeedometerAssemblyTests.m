//
//  RDSpeedometerAssemblyTests.m
//  RaceData
//
//  Created by alaija on 09/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <RamblerTyphoonUtils/AssemblyTesting.h>
#import <Typhoon/Typhoon.h>

#import "RDSpeedometerAssembly.h"
#import "RDSpeedometerAssembly_Testable.h"

#import "RDSpeedometerViewController.h"
#import "RDSpeedometerPresenter.h"
#import "RDSpeedometerInteractor.h"
#import "RDSpeedometerRouter.h"

@interface RDSpeedometerAssemblyTests : RamblerTyphoonAssemblyTests

@property (strong, nonatomic) RDSpeedometerAssembly *assembly;

@end

@implementation RDSpeedometerAssemblyTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.assembly = [[RDSpeedometerAssembly alloc] init];
    [self.assembly activate];
}

- (void)tearDown {
    self.assembly = nil;

    [super tearDown];
}

#pragma mark - Тестирование создания элементов модуля

- (void)testThatAssemblyCreatesViewController {
    // given
    Class targetClass = [RDSpeedometerViewController class];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    // when
    id result = [self.assembly viewSpeedometerModule];

    // then
    [self verifyTargetDependency:result
                       withClass:targetClass
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesPresenter {
    // given
    Class targetClass = [RDSpeedometerPresenter class];
    NSArray *dependencies = @[
                              RamblerSelector(interactor),
                              RamblerSelector(view),
                              RamblerSelector(router)
                              ];
    // when
    id result = [self.assembly presenterSpeedometerModule];

    // then
    [self verifyTargetDependency:result
                       withClass:targetClass
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesInteractor {
    // given
    Class targetClass = [RDSpeedometerInteractor class];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    // when
    id result = [self.assembly interactorSpeedometerModule];

    // then
    [self verifyTargetDependency:result
                       withClass:targetClass
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesRouter {
    // given
    Class targetClass = [RDSpeedometerRouter class];
    NSArray *dependencies = @[
                              RamblerSelector(transitionHandler)
                              ];
    // when
    id result = [self.assembly routerSpeedometerModule];

    // then
    [self verifyTargetDependency:result
                       withClass:targetClass
                    dependencies:dependencies];
}

@end