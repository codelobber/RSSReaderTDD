//
//  RSSTableInteractorInput.h
//  RSSReaderTDD
//
//  Created by lets Code on 30/10/2016.
//  Copyright © 2016 we. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RSSTableInteractorInput <NSObject>

/**
 @author lets Code
 
 Метод инициирует загрузку новостей со всех RSS каналов
 */
- (void) loadAllRSSChanel;

@end
