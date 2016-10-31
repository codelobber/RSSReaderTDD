#import "RSSLoader.h"

@implementation RSSLoader

- (void) loadRSSFromUrl:(NSString *) urlString {
        NSError * error = nil;
        NSURL * url = [NSURL URLWithString:urlString];
        NSData * data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
        if (error) {
            [self reciveError:error];
        } else {
            [self parseData:data];

        }
}

- (void) parseData:(NSData *) data{
    NSXMLParser * xmlParser = [[NSXMLParser alloc] initWithData:data];
    xmlParser.delegate = _parser;
    [xmlParser parse];
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
    NSLog(@" - %i",[arrayXML count]);
    [self.output didLoadAndParseNewsInArray:arrayXML];
}


@end
