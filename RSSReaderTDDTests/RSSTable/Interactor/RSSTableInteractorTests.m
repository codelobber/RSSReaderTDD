//
//  RSSTableInteractorTests.m
//  RSSReaderTDD
//
//  Created by lets Code on 30/10/2016.
//  Copyright © 2016 we. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RSSTableInteractor.h"

#import "RSSTableInteractorOutput.h"

@interface RSSTableInteractorTests : XCTestCase

@property (nonatomic, strong) RSSTableInteractor *interactor;

@property (nonatomic, strong) id mockOutput;

@end

@implementation RSSTableInteractorTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.interactor = [[RSSTableInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(RSSTableInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов RSSTableInteractorInput

- (void) testThatPasrserCanFinishWork {
    // given
    NSArray * testArray = nil;
    
    // when
    [self.interactor parse];
    
    
    // then
    //XCTAssert(true);
    OCMVerify([self.interactor  didLoadAndParseNewsInArray:testArray]);
//    OCMVerify([self.mockOutput didLoadAndParseNewsInArray:testArray]);
}

@end
