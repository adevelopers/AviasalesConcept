//
//  SearchResultsPresenter.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 15.10.2020.
//

#import "SearchResultsPresenter.h"

@implementation SearchResultsPresenter

- (NSArray<FlightModel *> *)items {
    return @[
        [[FlightModel alloc] initWithTitle:@"ABE-110"],
        [[FlightModel alloc] initWithTitle:@"PON-417"],
        [[FlightModel alloc] initWithTitle:@"SEP-34"],
    ];
}

@end
