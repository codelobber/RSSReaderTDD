//
//  RSSTableViewControllerTests.m
//  RSSReaderTDD
//
//  Created by lets Code on 30/10/2016.
//  Copyright © 2016 we. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RSSTableViewController.h"

#import "RSSTableViewOutput.h"

@interface RSSTableViewControllerTests : XCTestCase

@property (nonatomic, strong) RSSTableViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation RSSTableViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.controller = [[RSSTableViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(RSSTableViewOutput));

    self.controller.output = self.mockOutput;
}

- (void)tearDown {
    self.controller = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование жизненного цикла

- (void)testThatControllerNotifiesPresenterOnDidLoad {
	// given

	// when
	[self.controller viewDidLoad];

	// then
	OCMVerify([self.mockOutput didTriggerViewReadyEvent]);
}

#pragma mark - Тестирование методов интерфейса

#pragma mark - Тестирование методов RSSTableViewInput

@end
