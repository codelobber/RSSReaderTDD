//
//  RSSTableAssembly_Testable.h
//  RSSReaderTDD
//
//  Created by lets Code on 30/10/2016.
//  Copyright © 2016 we. All rights reserved.
//

#import "RSSTableAssembly.h"

@class RSSTableViewController;
@class RSSTableInteractor;
@class RSSTablePresenter;
@class RSSTableRouter;

@interface RSSTableAssembly ()

- (RSSTableViewController *)viewRSSTable;
- (RSSTablePresenter *)presenterRSSTable;
- (RSSTableInteractor *)interactorRSSTable;
- (RSSTableRouter *)routerRSSTable;

@end
