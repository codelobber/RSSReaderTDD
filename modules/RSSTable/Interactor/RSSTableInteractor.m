//
//  RSSTableInteractor.m
//  RSSReaderTDD
//
//  Created by lets Code on 30/10/2016.
//  Copyright © 2016 we. All rights reserved.
//

#import "RSSTableInteractor.h"

#import "RSSTableInteractorOutput.h"

@implementation RSSTableInteractor

#pragma mark - Методы RSSTableInteractorInput

- (void) loadAllRSSChanel{
    _newsArray = @[];
    _urlsToLoad = @[@"https://www.gazeta.ru/export/rss/lenta.xml",@"https://lenta.ru/rss"];
    _urlsAlias = @[@"gazeta.ru",@"lenta.ru"];
    [self loadRssChanel];
}

- (void) loadRssChanel {
    if([_urlsToLoad count]>0){
        NSString * url =[_urlsToLoad objectAtIndex:0];
        NSString * alias = [_urlsAlias objectAtIndex:0];
        if([_urlsToLoad count]>1){
            _urlsToLoad = [_urlsToLoad subarrayWithRange:NSMakeRange(1, [_urlsToLoad count]-1)];
            _urlsAlias = [_urlsAlias subarrayWithRange:NSMakeRange(1, [_urlsAlias count]-1)];
        } else {
            _urlsToLoad = @[];
        }
        [_rssloader loadRSSFromUrl:url withAlias:alias];
    }
}

- (void) didLoadAndParseNewsInArray:(NSArray *)newsArray{
    _newsArray = [_newsArray arrayByAddingObjectsFromArray:newsArray];
    if([_urlsToLoad count]>0) {
        [self loadRssChanel];
    } else {
        [_output allRSSChanelLoadedInArray:_newsArray];
    }
}

- (void) didReciveError:(NSError *)error{
    NSLog(@" %@",error);
}

@end
