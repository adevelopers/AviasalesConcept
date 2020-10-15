//
//  PickerCell.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 15.10.2020.
//

#import "PickerCell.h"

@implementation PickerCell

+ (NSString*)reuseId {
    return @"PickerCell";
}

- (UIImageView *)iconImageView {
    if (_iconImageView == nil) {
        UIImageView* view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"datePicker"]];
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
        _iconImageView = view;
    }
    
    return _iconImageView;
}

- (UILabel *)captionLabel {
    if (_captionLabel == nil) {
        UILabel* label = [UILabel new];
        label.text = @"Дата отлёта";
        label.textColor = [UIColor colorNamed:@"searchFormCaption"];
        label.font = [UIFont systemFontOfSize:12 weight:UIFontWeightBold];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        _captionLabel = label;
    }
    
    return _captionLabel;
}

- (UILabel *)valueLabel {
    if (_valueLabel == nil) {
        UILabel* label = [UILabel new];
        label.text = @"Mon, 14 Dec";
        label.textColor = [UIColor colorNamed:@"searchFormValue"];
        label.font = [UIFont systemFontOfSize:16 weight:UIFontWeightBold];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        _valueLabel = label;
    }
    
    return _valueLabel;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = UIColor.whiteColor;
    
    [self addSubview:self.iconImageView];
    [self addSubview:self.captionLabel];
    [self addSubview:self.valueLabel];
    
    [NSLayoutConstraint activateConstraints:@[
        [_iconImageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
        [_iconImageView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:21],
        
        [_captionLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:5],
        [_captionLabel.leftAnchor constraintEqualToAnchor:self.iconImageView.rightAnchor constant:20],
        
        [_valueLabel.topAnchor constraintEqualToAnchor:self.captionLabel.bottomAnchor constant:5],
        [_valueLabel.leftAnchor constraintEqualToAnchor:self.iconImageView.rightAnchor constant:20],
    ]];
}

- (void)setupIcon:(UIImage*)image andCaption:(NSString*)caption andValue:(NSString*)value {
    
    self.iconImageView.image = image;
    self.captionLabel.text = caption;
    self.valueLabel.text = value;
    
}

@end
