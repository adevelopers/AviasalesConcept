//
//  NewsItem.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 21.10.2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsItem : NSObject

@property (nonatomic, strong) NSString* title;
@property (nonatomic, nullable, copy) NSString* content;
@property (nonatomic, nullable, copy) NSString* urlToImage;
@property (nonatomic, strong) NSString* publishedAt;


- (instancetype) initWithDictionary:(NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
