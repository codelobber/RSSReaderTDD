#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "RSSLoader.h"

@interface RSSLoaderTests : XCTestCase

@property (nonatomic, strong) RSSLoader *service;

@property (nonatomic, strong) id mockOutput;

@end

@implementation RSSLoaderTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];
    
    self.service = [[RSSLoader alloc] init];
    
    self.mockOutput = OCMProtocolMock(@protocol(RSSLoaderOutput));
    
    self.service.output = self.mockOutput;
}

- (void)tearDown {
    self.service = nil;
    
    self.mockOutput = nil;
    
    [super tearDown];
}

#pragma mark - Тестирование методов RSSLoader

// проверить статусы ошибок
//- (void) testThatCauseNetworkError{
//    // given
//    NSString * url = @"qqw";
//    NSError * error = nil;
//    error = [NSError errorWithDomain:@"NSCocoaErrorDomain" code:256 userInfo:@{@"NSURL":url}];
//    
//    // when
//    //[_service reciveError:error];
//    [_service loadRSSFromUrl:url];
//    
//    // then
//    OCMVerify([self.mockOutput didReciveError:error]);
//}

- (void) testThatParseDemoXML{
    // given
    NSArray * array  = @[];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"demoRSS" ofType:@"xml"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    [_service parseData:data];
    
    XCTestExpectation *documentOpenExpectation = [self expectationWithDescription:@"document open"];

    
//    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 12);
//    dispatch_after(delay, dispatch_get_main_queue(), ^(void){
//        [documentOpenExpectation fulfill];
//    });
    
    // when
    

    // then
    [self waitForExpectationsWithTimeout:14 handler:^(NSError *error) {
        OCMVerify([self.mockOutput didLoadAndParseNewsInArray:array]);
    }];
//    OCMVerify([self.mockOutput didLoadAndParseNewsInArray:array]);
    
}

@end



