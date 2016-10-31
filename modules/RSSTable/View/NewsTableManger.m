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
        return [(NSNumber *)[_rowsMaxHeight objectForKey:indexPath] floatValue];
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
    [cell loadNews:[_news objectAtIndex:indexPath.row]];
    [_rowsMaxHeight setObject:[NSNumber numberWithFloat:cell.maxSize.height] forKey:indexPath];
    return cell;
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
