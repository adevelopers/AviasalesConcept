//
//  SearchResultsPresenter.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 15.10.2020.
//

#import <Foundation/Foundation.h>
#import "FlightModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchResultsPresenter : NSObject

@property (nonatomic, readwrite) NSArray<FlightModel*>* items;

@end

NS_ASSUME_NONNULL_END
