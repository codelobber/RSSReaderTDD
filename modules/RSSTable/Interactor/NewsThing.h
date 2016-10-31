#import <Foundation/Foundation.h>

@interface NewsThing : NSObject

@property (nullable,strong,nonatomic) NSString * title;
@property (nullable,strong,nonatomic) NSDate * date;
@property (nullable,strong,nonatomic) NSString * url;
@property (nullable,strong,nonatomic) NSString * text;
@property (nonatomic) float descriptionHeight;

@end
