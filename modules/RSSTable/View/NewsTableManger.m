//
//  NewsTableManger.m
//  RSSReaderTDD
//
//  Created by Все будет хорошо on 31/10/16.
//  Copyright © 2016 codelobber. All rights reserved.
//

#import "NewsTableManger.h"

@implementation NewsTableManger

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(_currentSelectedCell == indexPath){
        return ((NewsThing *)[_news objectAtIndex:indexPath.row]).descriptionHeight;
    }
    return 110.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_news count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"newsRow";
    
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NewsThing * topic = [_news objectAtIndex:indexPath.row];
    [cell loadNews:topic];
    topic.descriptionHeight = cell.maxSize.height;
    return cell;
}

- (void) reloadNewArray:(NSArray * _Nonnull) newData{
    _news = newData;
    [self updateTable];
}

- (void) updateTable {
    [self.output updateNewsTable];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _currentSelectedCell = indexPath;
    [tableView beginUpdates];
    [tableView endUpdates];
}

@end
