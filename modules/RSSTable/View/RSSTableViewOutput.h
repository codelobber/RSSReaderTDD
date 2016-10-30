//
//  RSSTableViewOutput.h
//  RSSReaderTDD
//
//  Created by lets Code on 30/10/2016.
//  Copyright © 2016 we. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RSSTableViewOutput <NSObject>

/**
 @author lets Code

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;

@end
