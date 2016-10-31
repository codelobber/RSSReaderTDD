#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "RSSXMLParser.h"
#import "NewsThing.h"


@interface RSSXMLParserTests : XCTestCase

@property (nonatomic, strong) RSSXMLParser * parser;

@property (nonatomic, strong) id mockDelegate;

@property (nonatomic, strong) NSXMLParser * xmlParser;

@end

@implementation RSSXMLParserTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];
    
    self.parser = [[RSSXMLParser alloc] init];
    
    _xmlParser = [NSXMLParser new];
    
    self.mockDelegate = OCMProtocolMock(@protocol(RSSXMLParserDelegate));

    self.parser.delegate = self.mockDelegate;
}

- (void)tearDown {
    self.parser = nil;
    
    self.mockDelegate = nil;
    
    _xmlParser = nil;
    
    [super tearDown];
}

#pragma mark - Тестирование методов RSSTableInteractorInput

- (void) testThatParseInitPropertys{
    // given
    
    // when
    [self.parser parserDidStartDocument:_xmlParser];
    
    // then
    XCTAssert(self.parser.news != nil);
}

- (void) testThatAfterInitPropertysIsDefaults{
    // given
    
    // when
    [self.parser parserDidStartDocument:_xmlParser];
    
    // then
    XCTAssert([self.parser.news count] == 0);
}

- (void) testThatAfterStartElemetsCurrentValueIsBlanc{
    // given
    NSString * elem = @"";
    NSString * ns = @"";
    NSString * qualifideName = @"";
    NSDictionary * attr = @{};
    
    
    // when
    [self.parser parser:_xmlParser didStartElement:elem namespaceURI:ns  qualifiedName:qualifideName  attributes:attr];
    
    // then
    XCTAssert([self.parser.currentValue isEqualToString:@""]);
}

- (void) testThatFindElemetItem{
    // given
    NSString * elem = @"item";
    NSString * ns = @"";
    NSString * qualifideName = @"";
    NSDictionary * attr = @{};
    
    
    // when
    [self.parser parser:_xmlParser didStartElement:elem namespaceURI:ns  qualifiedName:qualifideName  attributes:attr];
    
    // then
    XCTAssert(self.parser.newsThing != nil);
}


- (void) testThatFindImageTag{
    // given
    NSString * elem = @"enclosure";
    NSString * ns = @"";
    NSString * qualifideName = @"";
    NSString * testString = @";lk3lk23";
    NSDictionary * attr = @{@"type":@"image/png",@"url":testString};
    
    
    // when
    [self.parser parser:_xmlParser didStartElement:elem namespaceURI:ns  qualifiedName:qualifideName  attributes:attr];

    // then
    XCTAssert([self.parser.currentValue isEqualToString:testString]);
}

- (void) testThatFinishParseItem{
    // given
    NSString * elem = @"item";
    NSString * ns = @"";
    NSString * qualifideName = @"";
    NSDictionary * attr = @{@"type":@"image/png",@"url":@""};
    
    
    // when
    [self.parser parserDidStartDocument:_xmlParser];
    [self.parser parser:_xmlParser didStartElement:elem namespaceURI:ns  qualifiedName:qualifideName  attributes:attr];
    [self.parser parser:_xmlParser didEndElement:elem namespaceURI:ns qualifiedName:qualifideName];
    
    // then
    XCTAssert([self.parser.news count] == 1);
}

- (void) testThatFinishParseTitle{
    // given
    NSString * elem = @"title";
    NSString * ns = @"";
    NSString * qualifideName = @"";
    NSString * testString = @";lk3lk23";
    
    // when
    self.parser.newsThing = [NewsThing new];
    self.parser.currentValue = testString;
    [self.parser parser:_xmlParser didEndElement:elem namespaceURI:ns qualifiedName:qualifideName];
    
    // then
    XCTAssert([self.parser.newsThing.title isEqualToString:testString]);
}

- (void) testThatFinishParseDescription{
    // given
    NSString * elem = @"description";
    NSString * ns = @"";
    NSString * qualifideName = @"";
    NSString * testString = @";lk3lk23";
    
    // when
    self.parser.newsThing = [NewsThing new];
    self.parser.currentValue = testString;
    [self.parser parser:_xmlParser didEndElement:elem namespaceURI:ns qualifiedName:qualifideName];
    
    // then
    XCTAssert([self.parser.newsThing.text isEqualToString:testString]);
}

- (void) testThatFinishParseDate{
    // given
    NSString * elem = @"pubDate";
    NSString * ns = @"";
    NSString * qualifideName = @"";
    NSString * testString = @"Sun, 30 Oct 2016 00:12:12 +0300";
    NSDateFormatter * dateFormater = [[NSDateFormatter alloc] init];
    dateFormater.dateFormat = @"dd MMM yyyy HH:mm:ss";
    NSString * testDate = @"30 Oct 2016 00:12:12";
    
    // when
    self.parser.newsThing = [NewsThing new];
    self.parser.currentValue = testString;
    [self.parser parser:_xmlParser didEndElement:elem namespaceURI:ns qualifiedName:qualifideName];
    
    // then
    NSString * parseDate = [dateFormater stringFromDate:self.parser.newsThing.date];
    XCTAssert([parseDate isEqualToString:testDate]);
}

- (void) testThatFinishParseImage{
    // given
    NSString * elem = @"enclosure";
    NSString * ns = @"";
    NSString * qualifideName = @"";
    NSString * testString = @";lk3lk23";
    
    // when
    self.parser.newsThing = [NewsThing new];
    self.parser.currentValue = testString;
    [self.parser parser:_xmlParser didEndElement:elem namespaceURI:ns qualifiedName:qualifideName];
    
    // then
    XCTAssert([self.parser.newsThing.url isEqualToString:testString]);
}

- (void) testThatParserTrimTags{
    // given
    NSString * cleanString = @"lk3lk23";
    NSString * testedString = [NSString stringWithFormat:@"  %@  ",cleanString];
    
    // when
    self.parser.currentValue = @"";
    [self.parser parser:_xmlParser foundCharacters:testedString];
    
    // then
    XCTAssert([self.parser.currentValue isEqualToString:cleanString]);
}

- (void) testThatPasrserHaveException {
    // given
    NSError * error = [NSError new];
    
    // when
    [self.parser parser:_xmlParser parseErrorOccurred:error];
    
    // then
    OCMVerify([self.mockDelegate parseErrorOccurred:error]);
}


- (void) testThatPasrserCanFinishWork {
    // given
    NSArray * testArray = @[@"test",@"array"];
    
    // when
    self.parser.news = [NSMutableArray arrayWithArray:testArray];
    [self.parser parserDidEndDocument:_xmlParser];
    
    // then
    OCMVerify([self.mockDelegate didFinishParsingArray:testArray]);
}



@end



