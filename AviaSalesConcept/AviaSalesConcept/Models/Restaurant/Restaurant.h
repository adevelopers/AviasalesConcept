//
//  Restaurant.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 12.10.2020.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Restaurant : NSObject

@property (nonatomic) NSString* imageName;

- (instancetype)initWithName:(NSString*)name;

@end

NS_ASSUME_NONNULL_END
