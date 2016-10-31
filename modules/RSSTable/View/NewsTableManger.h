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
#import "NewsThing.h"

@protocol NewsTableInput

/**
 @author lets Code
 
 Метод Вызывается для обновления данных таблицы
 */
- (void) reloadNewArray:(NSArray * _Nonnull) newData;

@end

@protocol NewsTableOutput

/**
 @author lets Code
 
 Метод сообщает Вью о необходимости перезагрузить таблицу
 */
- (void) updateNewsTable;

@end

@interface NewsTableManger : NSObject <NewsTableInput,UITableViewDelegate,UITableViewDataSource>

@property (nullable,nonatomic,strong) NSArray * news;
@property (nullable,nonatomic,weak) NSIndexPath * currentSelectedCell;

@property (nonatomic, weak) id<NewsTableOutput> output;

@end
