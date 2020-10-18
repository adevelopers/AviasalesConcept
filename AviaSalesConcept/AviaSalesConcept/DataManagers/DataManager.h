//
//  DataManager.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 11.10.2020.
//

#import <Foundation/Foundation.h>
#import "Models.h"

#define kDataManagerLoadDataDidComplete @"DataManagerLoadDataDidComplete"

#define AirlineLogo(iata) [NSURL URLWithString:[NSString stringWithFormat:@"https://pics.avs.io/200/200/%@.png", iata]];

typedef enum DataSourceType {
    DataSourceTypeCountry,
    DataSourceTypeCity,
    DataSourceTypeAirport
} DataSourceType;

NS_ASSUME_NONNULL_BEGIN

@interface DataManager: NSObject

@property (nonatomic, readonly) NSArray* countries;
@property (nonatomic, readonly) NSArray* cities;
@property (nonatomic, readonly) NSArray* airports;


+ (instancetype)shared;
- (void)loadData;
- (City*)cityForIATA:(NSString*) iata;
- (void) loadAirportsWithCompletion:(void (^)(NSArray<Airport*>* airports))completion;


@end

NS_ASSUME_NONNULL_END
