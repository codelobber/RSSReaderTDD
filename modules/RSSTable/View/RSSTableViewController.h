//
//  RSSTableViewController.h
//  RSSReaderTDD
//
//  Created by lets Code on 30/10/2016.
//  Copyright © 2016 we. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RSSTableViewInput.h"

@protocol RSSTableViewOutput;

@interface RSSTableViewController : UIViewController <RSSTableViewInput>

@property (nonatomic, strong) id<RSSTableViewOutput> output;

@end
