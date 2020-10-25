//
//  MapViewController.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 25.10.2020.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CustomAnnotationView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MapViewController : UIViewController<CLLocationManagerDelegate>

- (void)addressFromLocation:(CLLocation *)location;

@end

NS_ASSUME_NONNULL_END
