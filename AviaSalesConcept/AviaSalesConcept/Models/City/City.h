//
//  City.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 11.10.2020.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface City: NSObject

@property(nonatomic, strong) NSString * name;
@property(nonatomic, strong) NSString * timezone;
@property(nonatomic, strong) NSDictionary * translations;
@property(nonatomic, strong) NSString * countryCode;
@property(nonatomic, strong) NSString * code;
@property(nonatomic) CLLocationCoordinate2D coordinate;

- (instancetype) initWithDictionary:( NSDictionary * )dictionary;

NS_ASSUME_NONNULL_END

@end
