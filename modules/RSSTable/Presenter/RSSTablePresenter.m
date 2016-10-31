//
//  RSSTablePresenter.m
//  RSSReaderTDD
//
//  Created by lets Code on 30/10/2016.
//  Copyright © 2016 we. All rights reserved.
//

#import "RSSTablePresenter.h"

#import "RSSTableViewInput.h"
#import "RSSTableInteractorInput.h"
#import "RSSTableRouterInput.h"

@implementation RSSTablePresenter

#pragma mark - Методы RSSTableModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы RSSTableViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
    [self.interactor loadAllRSSChanel];
}

#pragma mark - Методы RSSTableInteractorOutput

- (void)allRSSChanelLoadedInArray:(NSArray *)array{
    [self.view updateNewsData:array];
}

@end
