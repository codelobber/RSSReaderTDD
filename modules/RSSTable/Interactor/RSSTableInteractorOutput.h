//
//  RSSTableInteractorOutput.h
//  RSSReaderTDD
//
//  Created by lets Code on 30/10/2016.
//  Copyright © 2016 we. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RSSTableInteractorOutput <NSObject>

/**
 @author lets Code
 
 Метод отдает презентеру массив загружженых новостей слитых в один массив
 */
- (void) allRSSChanelLoadedInArray:(NSArray *) array;

@end
