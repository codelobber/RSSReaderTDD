#import "RSSLoader.h"

@implementation RSSLoader

- (void) loadRSSFromUrl:(NSString * _Nonnull) urlString withAlias:(NSString * _Nonnull) alias{
        NSError * error = nil;
        NSURL * url = [NSURL URLWithString:urlString];
        NSData * data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
        if (error) {
            [self reciveError:error];
        } else {
            [self parseData:data withAlias:alias];

        }
}

- (void) parseData:(NSData *) data withAlias:(NSString *)alias{
    NSXMLParser * xmlParser = [[NSXMLParser alloc] initWithData:data];
    [_parser setAlias:alias];
    xmlParser.delegate = _parser;
    [xmlParser parse];
    [self.output didLoadAndParseNewsInArray:[_parser getParsedArray]];
}

- (void) reciveError: (NSError * )  error{
    NSLog(@" + %@",error);
    [self.output didReciveError:error];
    //[self.output didReciveError:nil];
}

- (void)parseErrorOccurred:(NSError *)parseError{
    [self reciveError:parseError];
}

- (void)didFinishParsingArray:(NSArray *)arrayXML{
}


@end
