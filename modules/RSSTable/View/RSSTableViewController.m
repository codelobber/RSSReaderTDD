//
//  RSSTableViewController.m
//  RSSReaderTDD
//
//  Created by lets Code on 30/10/2016.
//  Copyright © 2016 we. All rights reserved.
//

#import "RSSTableViewController.h"

#import "RSSTableViewOutput.h"

@implementation RSSTableViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы RSSTableViewInput

- (void)setupInitialState {
	// В этом методе происходит настройка параметров view, зависящих от ее жизненого цикла (создание элементов, анимации и пр.)
    _newsTable.dataSource = _tableView;
    _newsTable.delegate = _tableView;
}

- (void)updateNewsData:(NSArray *)news{
    [_tableView reloadNewArray:news];
}

#pragma mark - Методы NewsTableOutput

- (void)updateNewsTable{
    [_newsTable reloadData];
}

@end
