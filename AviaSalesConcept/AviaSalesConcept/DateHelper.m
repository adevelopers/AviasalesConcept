//
//  DateHelper.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 23.10.2020.
//

#import "DateHelper.h"

@interface DateHelper ()

@end

@implementation DateHelper

+ (NSDateFormatter *)dateFormatter {
    static NSDateFormatter *dateFormatter;
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"dd MMMM";
        [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ru"]];
    });
    return  dateFormatter;
}

@end
