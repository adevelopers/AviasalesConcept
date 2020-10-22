//
//  NewsService.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 21.10.2020.
//

#import "NewsService.h"

#define NEWS_HOST "https://newsapi.org"
#define NEWS_TOKEN "669f5074a8fa42b4b93a347f39f4e595"

@implementation NewsService

+ (instancetype)shared {
    static NewsService *instance;
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        instance = [NewsService new];
    });
  return  instance;
}

- (void)loadFeed:(void (^)(NSArray<NewsItem*>*))completion {
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    NSString* linkToFeed = [NSString stringWithFormat:@"%s/v2/everything?q=%@&from=2020-10-21&sortBy=publishedAt&apiKey=%s",
                            NEWS_HOST,
                            @"flights",
                            NEWS_TOKEN];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:linkToFeed]
      cachePolicy:NSURLRequestUseProtocolCachePolicy
      timeoutInterval:10.0];
    NSDictionary *headers = @{
      @"Cookie": @"__cfduid=d4b8122a48e946b1a9ec2a5355cf495bc1603294907"
    };

    [request setAllHTTPHeaderFields:headers];
    [request setHTTPMethod:@"GET"];

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
      if (error) {
        NSLog(@"❌ %@", error);
          completion(@[]);
      } else {

        NSError *parseError = nil;
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
          if ([responseDictionary[@"articles"] isKindOfClass:[NSArray class]]) {
              NSMutableArray<NewsItem*>* newsItems = [NSMutableArray new];
              NSArray* articles = (NSArray*)responseDictionary[@"articles"];
              for (NSDictionary* articleDictionary in articles) {
                  NewsItem* item = [[NewsItem alloc] initWithDictionary:articleDictionary];
                  [newsItems addObject:item];
              }
              completion(newsItems);
              
          } else {
              completion(@[]);
          }
        
        dispatch_semaphore_signal(sema);
      }
    }];
    [dataTask resume];
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    
    
    
    
}

@end
