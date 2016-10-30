//
//  RSSTableRouterTests.m
//  RSSReaderTDD
//
//  Created by lets Code on 30/10/2016.
//  Copyright © 2016 we. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RSSTableRouter.h"

@interface RSSTableRouterTests : XCTestCase

@property (nonatomic, strong) RSSTableRouter *router;

@end

@implementation RSSTableRouterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.router = [[RSSTableRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end
