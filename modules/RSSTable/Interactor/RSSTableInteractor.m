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
    NSLog(@" == ");
    [_rssloader loadRSSFromUrl:@"https://www.gazeta.ru/export/rss/lenta.xml"];
}

- (void) didLoadAndParseNewsInArray:(NSArray *)newsArray{
    [_output allRSSChanelLoadedInArray:newsArray];
}

- (void) didReciveError:(NSError *)error{
    NSLog(@" %@",error);
}

@end
