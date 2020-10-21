//
//  NewsItemCell.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 21.10.2020.
//

#import "NewsItemCell.h"

@implementation NewsItemCell

+ (NSString*)reuseId {
    return @"NewsItemCell";
}

- (UIImageView *)imageView {
    if (_imageView == nil) {
        UIImageView* view = [UIImageView new];
        view.contentMode = UIViewContentModeScaleAspectFill;
        view.clipsToBounds = YES;
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
        _imageView = view;
    }
    
    return _imageView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        UILabel* label = [UILabel new];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        label.textColor = UIColor.whiteColor;
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        label.numberOfLines = 0;
        
        label.shadowColor = UIColor.blackColor;
        label.shadowOffset = CGSizeMake(0,1);
        
        _titleLabel = label;
    }
    
    return _titleLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.imageView.image = nil;
}

- (void)setupUI {
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.titleLabel];
    self.contentView.layer.cornerRadius = 4;
    self.contentView.clipsToBounds = YES;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [self.imageView.leftAnchor constraintEqualToAnchor:self.leftAnchor],
        [self.imageView.rightAnchor constraintEqualToAnchor:self.rightAnchor],
        [self.imageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
        
        [self.titleLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:32],
        [self.titleLabel.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:8],
        [self.titleLabel.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-8],
    ]];
}

@end
