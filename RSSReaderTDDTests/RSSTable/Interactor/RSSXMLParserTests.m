#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "RSSXMLParser.h"

@interface RSSXMLParser : XCTestCase

@property (nonatomic, strong) RSSXMLParser *parser;

@property (nonatomic, strong) id mockOutput;

@end

@implementation RSSXMLParser

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



