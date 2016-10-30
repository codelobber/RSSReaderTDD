//
//  RSSTableInteractor.h
//  RSSReaderTDD
//
//  Created by lets Code on 30/10/2016.
//  Copyright © 2016 we. All rights reserved.
//

#import "RSSTableInteractorInput.h"

@protocol RSSTableInteractorOutput;

@interface RSSTableInteractor : NSObject <RSSTableInteractorInput>

@property (nonatomic, weak) id<RSSTableInteractorOutput> output;

@end
