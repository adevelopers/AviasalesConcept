//
//  NewsService.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 21.10.2020.
//

#import <UIKit/UIKit.h>
#import "NewsItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsService : NSObject

+ (instancetype)shared;

- (void)loadFeed:(void (^)(NSArray<NewsItem*>*))completion;

@end

NS_ASSUME_NONNULL_END
