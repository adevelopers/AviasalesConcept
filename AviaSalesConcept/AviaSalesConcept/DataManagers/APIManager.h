//
//  APIManager.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 17.10.2020.
//

#import <Foundation/Foundation.h>
#import "Models.h"
#import "RequestCondition.h"
#import "DataManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface APIManager : NSObject

+ (instancetype) shared;

- (void) cityForCurrentIP:(void  (^)( City *city) ) completion;
//- (void) mapPricesFor:(City *)origin withCompletion:(void (^)( NSArray  *prices)) completion;
- (void) ticketsWithRequest:(RequestCondition*) request withCompletion:(void (^)(NSArray *tickets))completion;


@end

NS_ASSUME_NONNULL_END
