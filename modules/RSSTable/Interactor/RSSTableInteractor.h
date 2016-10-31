//
//  RSSTableInteractor.h
//  RSSReaderTDD
//
//  Created by lets Code on 30/10/2016.
//  Copyright © 2016 we. All rights reserved.
//

#import "RSSTableInteractorInput.h"
#import "RSSLoader.h"

@protocol RSSTableInteractorOutput;

@interface RSSTableInteractor : NSObject <RSSTableInteractorInput>

@property (nonatomic, weak) id<RSSTableInteractorOutput> output;
@property (nonatomic, weak) id <RSSLoaderInput> rssloader;

@end
