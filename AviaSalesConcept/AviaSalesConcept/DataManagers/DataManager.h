//
//  DataManager.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 11.10.2020.
//

#import <Foundation/Foundation.h>
#import "Country.h"
#import "City.h"
#import "Airport.h"

#define kDataManagerLoadDataDidComplete @"DataManagerLoadDataDidComplete"

#define AirlineLogo(iata) [NSURL URLWithString:[NSString stringWithFormat:@"https://pics.avs.io/200/200/%@.png", iata]];

typedef enum DataSourceType {
    DataSourceTypeCountry,
    DataSourceTypeCity,
    DataSourceTypeAirport
} DataSourceType;

NS_ASSUME_NONNULL_BEGIN

@interface DataManager: NSObject

+ (instancetype)shared;
- (void)loadData;
- (City*)cityForIATA:(NSString*) iata;

@property (nonatomic, strong, readonly) NSArray* countries;
@property (nonatomic, strong, readonly) NSArray* cities;
@property (nonatomic, strong, readonly) NSArray* airports;

NS_ASSUME_NONNULL_END

@end
