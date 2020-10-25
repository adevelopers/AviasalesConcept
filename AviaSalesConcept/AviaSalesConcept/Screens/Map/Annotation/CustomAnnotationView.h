//
//  CustomAnnotationView.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 25.10.2020.
//

#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomAnnotationView : MKPinAnnotationView

+ (NSString*)reuseId;

@end

NS_ASSUME_NONNULL_END
