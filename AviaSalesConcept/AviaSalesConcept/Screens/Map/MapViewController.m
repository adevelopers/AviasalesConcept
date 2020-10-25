//
//  MapViewController.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 25.10.2020.
//

#import "MapViewController.h"
#import "MapViewController+MapKit.h"
#import <CoreLocation/CoreLocation.h>


@interface MapViewController () {
    @private
    NSArray* locations;
}

@property (nonatomic) MKMapView* mapView;
@property (nonatomic) CLLocationManager* locationManager;

@end


@implementation MapViewController

- (MKMapView *)mapView {
    if (_mapView == nil) {
        MKMapView* mapView = [[MKMapView alloc] initWithFrame:CGRectZero];
        mapView.backgroundColor = UIColor.whiteColor;
        mapView.delegate = self;
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(55.7522200, 37.6155600);
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 1000000, 1000000);
        [mapView setShowsUserLocation:YES];
        [mapView setRegion: region animated: YES];
        [mapView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [mapView registerClass:[CustomAnnotationView class] forAnnotationViewWithReuseIdentifier: CustomAnnotationView.reuseId];
        _mapView = mapView;
    }
    
    return _mapView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [CLLocationManager new];
    self.locationManager.activityType = CLActivityTypeAirborne;
    self.locationManager.delegate = self;
    
    [self.locationManager requestWhenInUseAuthorization];
    
    [self.locationManager startUpdatingLocation];
    
    
    [self.locationManager requestLocation];
    
    CLLocationCoordinate2D userCoordinate = CLLocationCoordinate2DMake(58.592725, 16.185962);
    CLLocationCoordinate2D eyeCoordinate = CLLocationCoordinate2DMake(58.571647, 16.234660);
    
    MKMapCamera* mapCamera = [MKMapCamera cameraLookingAtCenterCoordinate:userCoordinate fromEyeCoordinate:eyeCoordinate eyeAltitude:400];
    MKPointAnnotation* annotation = [MKPointAnnotation new];
    [annotation setCoordinate: userCoordinate];
    
    [self.mapView setMapType:MKMapTypeSatellite];
    [self.mapView addAnnotation:annotation];
    [self.mapView setCamera:mapCamera animated:true];
    [self setupUI];
    
    
    [self addressFromLocation: self.mapView.userLocation.location];
}

- (void)setupUI {
    self.navigationItem.title = @"Карта";
    self.view.backgroundColor = [UIColor colorNamed:@"bg"];
    [self.view addSubview:self.mapView];
    
    
    [NSLayoutConstraint activateConstraints:@[
        [self.mapView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [self.mapView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor],
        [self.mapView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor],
        [self.mapView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
    ]];
}


- (void)addressFromLocation:(CLLocation *)location {
    printf("🔆🔆🔆 addressFromLocation\n");
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
       
        if ([placemarks count] > 0) {
            for (MKPlacemark *placemark in placemarks) {
                NSLog(@"🔆 %@", placemark.name);
            }
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



- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    if (userLocation) {
        NSLog(@"didUpdateUserLocation %@", userLocation.location);
    }
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    CLLocation* location = locations.firstObject;
    if (location) {
        NSLog(@"didUpdateLocations %@", location);
        [self.mapView setCenterCoordinate:location.coordinate animated:YES];
    }
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"❌ %@", error.localizedDescription);
}


@end

