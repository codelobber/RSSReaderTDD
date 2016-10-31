#import <Foundation/Foundation.h>
#import "NewsThing.h"

@protocol RSSXMLParserInput <NSObject>

@end

@protocol RSSXMLParserDelegate <NSObject>

/**
 
 Метод сообщает об ошибке парсинга
 */
- (void) parseErrorOccurred:( NSError * _Nonnull ) parseError;

/**
 
 Метод сообщает об завершении парсинга и возвращает Массив
 */
- (void) didFinishParsingArray:(NSArray * _Nonnull) arrayXML;


@end

@interface RSSXMLParser : NSObject <NSXMLParserDelegate,RSSXMLParserInput>

@property (nullable,nonatomic,strong) NSMutableArray * news;
@property (nullable,nonatomic,strong) NSString * currentValue;
@property (nullable,nonatomic,strong) NewsThing * newsThing;
@property (nullable,nonatomic,weak) id <RSSXMLParserDelegate> delegate;


@end


