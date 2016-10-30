//
//  RSSTablePresenter.h
//  RSSReaderTDD
//
//  Created by lets Code on 30/10/2016.
//  Copyright © 2016 we. All rights reserved.
//

#import "RSSTableViewOutput.h"
#import "RSSTableInteractorOutput.h"
#import "RSSTableModuleInput.h"

@protocol RSSTableViewInput;
@protocol RSSTableInteractorInput;
@protocol RSSTableRouterInput;

@interface RSSTablePresenter : NSObject <RSSTableModuleInput, RSSTableViewOutput, RSSTableInteractorOutput>

@property (nonatomic, weak) id<RSSTableViewInput> view;
@property (nonatomic, strong) id<RSSTableInteractorInput> interactor;
@property (nonatomic, strong) id<RSSTableRouterInput> router;

@end
