//
//  RSSTablePresenterTests.m
//  RSSReaderTDD
//
//  Created by lets Code on 30/10/2016.
//  Copyright © 2016 we. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RSSTablePresenter.h"

#import "RSSTableViewInput.h"
#import "RSSTableInteractorInput.h"
#import "RSSTableRouterInput.h"

@interface RSSTablePresenterTests : XCTestCase

@property (nonatomic, strong) RSSTablePresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation RSSTablePresenterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.presenter = [[RSSTablePresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(RSSTableInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(RSSTableRouterInput));
    self.mockView = OCMProtocolMock(@protocol(RSSTableViewInput));

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

#pragma mark - Тестирование методов RSSTableModuleInput

#pragma mark - Тестирование методов RSSTableViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

#pragma mark - Тестирование методов RSSTableInteractorOutput

@end
