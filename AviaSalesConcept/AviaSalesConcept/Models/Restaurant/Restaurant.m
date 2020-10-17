//
//  Restaurant.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 12.10.2020.
//

#import "Restaurant.h"

@implementation Restaurant

- (instancetype)initWithName:(NSString*)name
{
    self = [super init];
    if (self) {
        self.imageName = name;
    }
    return self;
}

@end
