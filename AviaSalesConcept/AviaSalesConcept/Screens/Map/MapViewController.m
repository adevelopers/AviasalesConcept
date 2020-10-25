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

@end


@implementation MapViewController

- (MKMapView *)mapView {
    if (_mapView == nil) {
        MKMapView* mapView = [[MKMapView alloc] initWithFrame:CGRectZero];
        mapView.backgroundColor = UIColor.whiteColor;
        mapView.delegate = self;
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(55.7522200, 37.6155600);
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 1000000, 1000000);
        [mapView setRegion: region animated: YES];
        [mapView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [mapView registerClass:[CustomAnnotationView class] forAnnotationViewWithReuseIdentifier: CustomAnnotationView.reuseId];
        _mapView = mapView;
    }
    
    return _mapView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CLLocationCoordinate2D userCoordinate = CLLocationCoordinate2DMake(58.592725, 16.185962);
    CLLocationCoordinate2D eyeCoordinate = CLLocationCoordinate2DMake(58.571647, 16.234660);
    
    MKMapCamera* mapCamera = [MKMapCamera cameraLookingAtCenterCoordinate:userCoordinate fromEyeCoordinate:eyeCoordinate eyeAltitude:400];
    MKPointAnnotation* annotation = [MKPointAnnotation new];
    [annotation setCoordinate: userCoordinate];
    
    [self.mapView setMapType:MKMapTypeSatellite];
    [self.mapView addAnnotation:annotation];
    [self.mapView setCamera:mapCamera animated:true];
    [self setupUI];
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

@end

