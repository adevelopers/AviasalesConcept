//
//  FlightModel.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 15.10.2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlightModel : NSObject

@property (nonatomic) NSString* title;

- (instancetype)initWithTitle:(NSString*)title;

@end

NS_ASSUME_NONNULL_END
