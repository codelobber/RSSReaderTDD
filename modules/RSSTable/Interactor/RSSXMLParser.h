//
//  RSSXMLParser.h
//  RSSReaderTDD
//
//  Created by Все будет хорошо on 30/10/16.
//  Copyright © 2016 codelobber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsThing.h"

@protocol RSSXMLParserDelegate <NSObject>

/**
 
 Метод сообщает об ошибке парсинга
 */
- (void) parseErrorOccurred:(NSError *) parseError;

/**
 
 Метод сообщает об завершении парсинга и возвращает Массив
 */
- (void) didFinishParsingArray:(NSArray *) arrayXML;


@end

@interface RSSXMLParser : NSObject <NSXMLParserDelegate>

@property (nullable,nonatomic,strong) NSMutableArray * news;
@property (nullable,nonatomic,strong) NSString * currentValue;
@property (nullable,nonatomic,strong) NewsThing * newsThing;

@property (nullable,nonatomic,weak) id <RSSXMLParserDelegate> delegate;

@end


