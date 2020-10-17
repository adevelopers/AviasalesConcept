//
//  RequestCondition.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 17.10.2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RequestCondition : NSObject

@property (nonatomic) NSString* origin;
@property (nonatomic) NSString* destination;
@property (nonatomic) NSDate *departDate;
@property (nonatomic) NSDate *returnDate;

@end

NS_ASSUME_NONNULL_END
