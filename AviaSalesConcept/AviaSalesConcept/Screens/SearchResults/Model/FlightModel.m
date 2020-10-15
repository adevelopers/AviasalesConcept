//
//  FlightModel.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 15.10.2020.
//

#import "FlightModel.h"

@implementation FlightModel

- (instancetype)initWithTitle:(NSString*)title {
    self = [super init];
    if (self) {
        self.title = title;
    }
    return self;
}

@end
