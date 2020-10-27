//
//  GeoCoder.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 27.10.2020.
//

#import "GeoCoder.h"

@implementation GeoCoder

+ (instancetype )shared {
    static GeoCoder *instance;
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        instance = [GeoCoder new];
    });
  return  instance;
}

// MARK: CLGeocoder
- (void)addressFromLocation:(CLLocation *)location andCompletion:(nonnull void (^)(NSArray * _Nonnull))completion {
    printf("🔆🔆🔆 addressFromLocation\n");
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
       
        if ([placemarks count] > 0) {
            for (MKPlacemark *placemark in placemarks) {
                NSLog(@"🔆 %@", placemark.name);
            }
            
            completion(placemarks);
        } else {
            completion(@[]);
        }
        
        if (error) {
            NSLog(@"❌ %@", error.localizedDescription);
        }
    }];
}

- (void)locationFromAddress:(NSString *)address {

    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if ([placemarks count] > 0) {
            for (MKPlacemark *placemark in placemarks) {
                NSLog(@"%@", placemark.location);
            }
        }
        
    }];
}

@end
