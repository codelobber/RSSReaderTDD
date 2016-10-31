//
//  RSSLoader.h
//  RSSReaderTDD
//
//  Created by Все будет хорошо on 30/10/16.
//  Copyright © 2016 codelobber. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RSSLoaderInput <NSObject>

- (void) loadRSSWithUrl:(NSString *) urlString;
- (void) parseRSSData: (NSData * ) data;

@end

@interface RSSLoader : NSObject <RSSLoaderInput>



@end


