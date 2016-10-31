//
//  RSSTableAssembly.m
//  RSSReaderTDD
//
//  Created by lets Code on 30/10/2016.
//  Copyright © 2016 we. All rights reserved.
//

#import "RSSTableAssembly.h"

#import "RSSTableViewController.h"
#import "RSSTableInteractor.h"
#import "RSSTablePresenter.h"
#import "RSSTableRouter.h"
#import "RSSLoader.h"
#import "RSSXMLParser.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation RSSTableAssembly

- (RSSTableViewController *)viewRSSTable {
    return [TyphoonDefinition withClass:[RSSTableViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterRSSTable]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterRSSTable]];
                          }];
}

- (RSSTableInteractor *)interactorRSSTable {
    return [TyphoonDefinition withClass:[RSSTableInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterRSSTable]];
                              [definition injectProperty:@selector(rssloader)
                                                    with:[self serviceRSSLoader]];
                          }];
}

- (RSSTablePresenter *)presenterRSSTable{
    return [TyphoonDefinition withClass:[RSSTablePresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewRSSTable]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorRSSTable]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerRSSTable]];
                          }];
}

- (RSSTableRouter *)routerRSSTable{
    return [TyphoonDefinition withClass:[RSSTableRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewRSSTable]];
                          }];
}

- (RSSLoader *) serviceRSSLoader {
    return [TyphoonDefinition withClass:[RSSLoader class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self interactorRSSTable]];
                              [definition injectProperty:@selector(parser)
                                                    with:[self serviceRSSXMLParser]];
                              
                          }];
}

- (RSSXMLParser *) serviceRSSXMLParser {
    return [TyphoonDefinition withClass:[RSSXMLParser class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(delegate)
                                                    with:[self serviceRSSLoader]];
                          }];
}

@end
