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
    
//    self.mockOutput = OCMProtocolMock(@protocol(RSSTableInteractorOutput));
//    
//    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.service = nil;
    
    self.mockOutput = nil;
    
    [super tearDown];
}

#pragma mark - Тестирование методов RSSTableInteractorInput

- (void) testTryLoadWrongURL{
    [_service loadRSSWithUrl:@"wrongUrl"];
    
}

@end



