//
//  MainFlow.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 21.10.2020.
//

#import <Foundation/Foundation.h>
#import "NewsItem.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MainFlow <NSObject>

-(void)showNewsDetail:(NewsItem*)item;

@end

NS_ASSUME_NONNULL_END
