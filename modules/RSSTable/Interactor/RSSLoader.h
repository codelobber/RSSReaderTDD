#import <Foundation/Foundation.h>
#import "RSSXMLParser.h"

@protocol RSSLoaderInput <NSObject>

- (void) loadRSSFromUrl:(NSString * _Nonnull) urlString withAlias:(NSString * _Nonnull) alias;

@end

@protocol RSSLoaderOutput <NSObject>

/**
 
 Метод сообщает об успешном загрузке и парсинге новостей
 */
- (void) didLoadAndParseNewsInArray:(NSArray * _Nonnull) newsArray;

/**
 
 Метод сообщает об ошибке при загрузке или парсинге новостей
 */
- (void) didReciveError:(NSError * _Nullable) error;


@end

@interface RSSLoader : NSObject <RSSLoaderInput,RSSXMLParserDelegate>

@property (nullable, nonatomic, weak) id <RSSLoaderOutput> output;
@property (nullable, nonatomic, weak) id <RSSXMLParserInput,NSXMLParserDelegate> parser;

@end


