//
//  RSSTableRouter.h
//  RSSReaderTDD
//
//  Created by lets Code on 30/10/2016.
//  Copyright © 2016 we. All rights reserved.
//

#import "RSSTableRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface RSSTableRouter : NSObject <RSSTableRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
