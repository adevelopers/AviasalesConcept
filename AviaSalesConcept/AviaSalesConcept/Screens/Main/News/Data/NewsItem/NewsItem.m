//
//  NewsItem.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 21.10.2020.
//

#import "NewsItem.h"

@implementation NewsItem


- (instancetype) initWithDictionary:(NSDictionary*)dictionary {
    self = [super init];
    if (self) {
        _title = [dictionary valueForKey:@"title"];
        _content = [dictionary valueForKey:@"content"] == [NSNull null] ? @"" : [dictionary valueForKey:@"content"];
        _urlToImage = [dictionary valueForKey:@"urlToImage"] == [NSNull null] ? @"" : [dictionary valueForKey:@"urlToImage"];
        _publishedAt = [dictionary valueForKey:@"publishedAt"];
    }
    
    return self;
}

@end
