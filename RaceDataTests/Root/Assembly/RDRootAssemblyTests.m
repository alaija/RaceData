//
//  RDRootAssemblyTests.m
//  RaceData
//
//  Created by alaija on 27/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <RamblerTyphoonUtils/AssemblyTesting.h>
#import <Typhoon/Typhoon.h>

#import "RDRootAssembly.h"
#import "RDRootAssembly_Testable.h"

#import "RDRootViewController.h"
#import "RDRootPresenter.h"
#import "RDRootInteractor.h"
#import "RDRootRouter.h"

@interface RDRootAssemblyTests : RamblerTyphoonAssemblyTests

@property (strong, nonatomic) RDRootAssembly *assembly;

@end

@implementation RDRootAssemblyTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.assembly = [[RDRootAssembly alloc] init];
    [self.assembly activate];
}

- (void)tearDown {
    self.assembly = nil;

    [super tearDown];
}

#pragma mark - Тестирование создания элементов модуля

- (void)testThatAssemblyCreatesViewController {
    // given
    Class targetClass = [RDRootViewController class];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    // when
    id result = [self.assembly viewRootModule];

    // then
    [self verifyTargetDependency:result
                       withClass:targetClass
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesPresenter {
    // given
    Class targetClass = [RDRootPresenter class];
    NSArray *dependencies = @[
                              RamblerSelector(interactor),
                              RamblerSelector(view),
                              RamblerSelector(router)
                              ];
    // when
    id result = [self.assembly presenterRootModule];

    // then
    [self verifyTargetDependency:result
                       withClass:targetClass
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesInteractor {
    // given
    Class targetClass = [RDRootInteractor class];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    // when
    id result = [self.assembly interactorRootModule];

    // then
    [self verifyTargetDependency:result
                       withClass:targetClass
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesRouter {
    // given
    Class targetClass = [RDRootRouter class];
    NSArray *dependencies = @[
                              RamblerSelector(transitionHandler)
                              ];
    // when
    id result = [self.assembly routerRootModule];

    // then
    [self verifyTargetDependency:result
                       withClass:targetClass
                    dependencies:dependencies];
}

@end