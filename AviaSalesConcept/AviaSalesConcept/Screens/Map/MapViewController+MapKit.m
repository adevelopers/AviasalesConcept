//
//  MapViewController+MapView.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 25.10.2020.
//

#import "MapViewController+MapKit.h"

@implementation MapViewController (MapKit)

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    CustomAnnotationView* annotationView = (CustomAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:CustomAnnotationView.reuseId];

    if (annotationView) {
        UIImageView* calloutView = [UIImageView new];
        calloutView.image = [UIImage imageNamed:@"ava1"];
        calloutView.backgroundColor = UIColor.whiteColor;
        calloutView.layer.cornerRadius = 100;
        calloutView.layer.masksToBounds = YES;
        
        annotationView.detailCalloutAccessoryView = calloutView;
        [annotationView setCanShowCallout:YES];
        annotationView.calloutOffset = CGPointMake(-8, 0);
        
        [NSLayoutConstraint activateConstraints:@[
            [calloutView.widthAnchor constraintEqualToConstant:200],
            [calloutView.heightAnchor constraintEqualToConstant:200],
        ]];
        
        return annotationView;
    }

    return nil;
}




@end
