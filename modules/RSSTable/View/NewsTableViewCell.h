//
//  NewsTableViewCell.h
//  RSSReaderTDD
//
//  Created by Все будет хорошо on 31/10/16.
//  Copyright © 2016 codelobber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *copyrighLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property (nonatomic) CGSize maxSize;

- (void) loadNews:(NewsThing *) newsThing;

@end
