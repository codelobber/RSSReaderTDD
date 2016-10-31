//
//  RSSTableViewInput.h
//  RSSReaderTDD
//
//  Created by lets Code on 30/10/2016.
//  Copyright © 2016 we. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RSSTableViewInput <NSObject>

/**
 @author lets Code

 Метод настраивает начальный стейт view
 */
- (void)setupInitialState;

/**
 @author lets Code
 
 Метод обновляет таблицу новостей
 */
- (void)updateNewsData:(NSArray *) news;

@end
