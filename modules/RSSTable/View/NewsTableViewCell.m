//
//  NewsTableViewCell.m
//  RSSReaderTDD
//
//  Created by Все будет хорошо on 31/10/16.
//  Copyright © 2016 codelobber. All rights reserved.
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (CGSize) getMaxSize{
    CGRect frame = _descLabel.frame;
    frame.size.height = [_descLabel sizeThatFits:CGSizeMake(_descLabel.frame.size.width, MAXFLOAT)].height;
    [_descLabel setFrame:frame];
    
    
    CGSize size = CGSizeMake(0, 0);
    size.height = _descLabel.frame.origin.y + 10 + frame.size.height;
    
    return size;
}

/**
 @author lets Code
 
 Метод подставляет данные в ячейку
 */
- (void) loadNews:(NewsThing *) newsThing{
    [_titleLabel setText:newsThing.title];
    [_descLabel setText:newsThing.text];
    [_copyrighLabel setText:newsThing.source];
    
    [self fitAndResize:_titleLabel];
    [self fitAndResize:_descLabel];

    _maxSize = [self getMaxSize];
    
    
    if(newsThing.url != nil){
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
        dispatch_async(queue, ^{
            NSError * error = nil;
            NSData * imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:newsThing.url] options:0 error:&error];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImage *image = [UIImage imageWithData:imageData];
                _image.contentMode = UIViewContentModeScaleAspectFill;
                [_image setImage:image];
                
            });
        });
    } else {
        _image.contentMode = UIViewContentModeScaleAspectFill;
        [_image setImage:[UIImage imageNamed:@"blank.png"]];
    }
}

- (void) fitAndResize:(UILabel *) label{
    CGRect frame = [label frame];
    [label sizeToFit];
    frame.size.height = [label frame].size.height;
    [label setFrame:frame];
}

@end
