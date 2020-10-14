//
//  SegmentControl.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 15.10.2020.
//

#import "SegmentControl.h"

@implementation SegmentControl

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.layer.cornerRadius = 4;
    self.layer.shadowColor = [UIColor.blackColor colorWithAlphaComponent:0.25].CGColor;
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 1;
    self.layer.shadowOffset = CGSizeMake(2, 2);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.layer.cornerRadius = self.bounds.size.height / 2;
    
}


@end
