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
}

#pragma mark - Методы RSSTableInteractorOutput

@end
