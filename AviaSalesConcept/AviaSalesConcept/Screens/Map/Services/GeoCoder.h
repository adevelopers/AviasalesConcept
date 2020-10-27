//
//  GeoCoder.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 27.10.2020.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface GeoCoder : NSObject

+ (instancetype )shared;
- (void)addressFromLocation:(CLLocation *)location andCompletion:(void (^)(NSArray* places))completion;
- (void)locationFromAddress:(NSString *)address;

@end

NS_ASSUME_NONNULL_END
