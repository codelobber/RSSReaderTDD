//
//  RSSXMLParser.m
//  RSSReaderTDD
//
//  Created by Все будет хорошо on 30/10/16.
//  Copyright © 2016 codelobber. All rights reserved.
//

#import "RSSXMLParser.h"

@implementation RSSXMLParser


-(void)parserDidStartDocument:(NSXMLParser *)parser{
    _news = [[NSMutableArray alloc] init];
}

-(void)parserDidEndDocument:(NSXMLParser *)parser{
    [self.delegate didFinishParsingArray:[NSArray arrayWithArray:_news]];
    
    _news = nil;
    _currentValue = nil;
    _newsThing = nil;
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    [self.delegate parseErrorOccurred:parseError];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    _currentValue = @"";
    if ([elementName isEqualToString:@"item"]) {
        _newsThing = [NewsThing new] ;
    } else if ([elementName isEqualToString:@"enclosure"] && [[attributeDict objectForKey:@"type"] hasPrefix:@"image"]){
        _currentValue = [_currentValue stringByAppendingString:[attributeDict objectForKey:@"url"]];
    }
}


-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    if ([elementName isEqualToString:@"item"]) {
        [_news addObject:_newsThing];
    } else if ([elementName isEqualToString:@"title"]) {
        _newsThing.title = _currentValue;
    } else if ([elementName isEqualToString:@"description"]) {
        _newsThing.text = _currentValue;
    } else if ([elementName isEqualToString:@"pubDate"]) {
        NSDateFormatter * dateFormater = [[NSDateFormatter alloc] init];
        dateFormater.dateFormat = @"EEE, dd MMM yyyy HH:mm:ss ZZZ";
        _newsThing.date = [dateFormater dateFromString:_currentValue];
    } else if ([elementName isEqualToString:@"enclosure"]) {
        _newsThing.url = _currentValue;
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    string = [string stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    _currentValue = [_currentValue stringByAppendingString:string];
    
}

@end
