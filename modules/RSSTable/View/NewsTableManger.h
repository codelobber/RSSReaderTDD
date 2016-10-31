//
//  NewsTableManger.h
//  RSSReaderTDD
//
//  Created by Все будет хорошо on 31/10/16.
//  Copyright © 2016 codelobber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NewsTableViewCell.h"

@protocol NewsTableInput

- (void) reloadNewArray:(NSArray * _Nonnull) newData;

@end

@protocol NewsTableOutput

- (void) updateNewsTable;

@end

@interface NewsTableManger : NSObject <NewsTableInput,UITableViewDelegate,UITableViewDataSource>

@property (nullable,nonatomic,strong) NSArray * news;
@property (nullable,nonatomic,strong) NSMutableDictionary * rowsMaxHeight;
@property (nullable,nonatomic,weak) NSIndexPath * currentSelectedCell;

@property (nonatomic, weak) id<NewsTableOutput> output;

@end
