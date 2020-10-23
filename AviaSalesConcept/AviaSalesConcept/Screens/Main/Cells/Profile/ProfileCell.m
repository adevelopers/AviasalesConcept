//
//  ProfileCell.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 20.10.2020.
//

#import "ProfileCell.h"

@implementation ProfileCell

+ (NSString *)reuseId {
    return @"ProfileCell";
}


- (UILabel*)userNameLabel {
    if (_userNameLabel == nil) {
        UILabel* label = [UILabel new];
        label.text = @"Ivone";
        label.font = [UIFont systemFontOfSize:24 weight: UIFontWeightBold];
        label.textColor = [UIColor colorNamed:@"textPrimary"];
        label.backgroundColor = UIColor.clearColor;
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        _userNameLabel = label;
    }
    return _userNameLabel;
}

- (UIImageView*)userAvatarView {
    
    if (_userAvatarView == nil) {
        UIImageView* view = [UIImageView new];
        view.contentMode = UIViewContentModeScaleAspectFit;
        view.image = [UIImage imageNamed:@"ava1"];
        view.layer.cornerRadius = 30;
        view.layer.masksToBounds = true;
        
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
        _userAvatarView = view;
    }
    return _userAvatarView;
}

- (UILabel*)userSubtitleLabel {
    if (_userSubtitleLabel == nil) {
        UILabel* label = [UILabel new];
        label.textColor = [UIColor colorNamed:@"textSecond"];
        label.text = @"Лето, время взять билет и махнуть на пляж ";
        label.numberOfLines = 0;
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        _userSubtitleLabel = label;
    }
    
    return  _userSubtitleLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = UIColor.clearColor;
    
    [self.contentView addSubview:self.userNameLabel];
    [self.contentView addSubview:self.userAvatarView];
    [self.contentView addSubview:self.userSubtitleLabel];
    
    NSLayoutConstraint* userAvatarRight = [self.userAvatarView.rightAnchor constraintEqualToAnchor: self.rightAnchor constant:-16];
    userAvatarRight.priority = 1000;
    NSLayoutConstraint* userSubtitleRightToAvatarLeft = [self.userSubtitleLabel.rightAnchor constraintEqualToAnchor: self.userAvatarView.leftAnchor constant:-8];
    userSubtitleRightToAvatarLeft.priority = 999;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.userNameLabel.leftAnchor constraintEqualToAnchor: self.leftAnchor constant:16],
        [self.userNameLabel.rightAnchor constraintEqualToAnchor: self.rightAnchor constant:16],
        [self.userNameLabel.topAnchor constraintEqualToAnchor: self.safeAreaLayoutGuide.topAnchor constant:16],
        [self.userNameLabel.heightAnchor constraintEqualToConstant:30],
        
        userAvatarRight,
        [self.userAvatarView.topAnchor constraintEqualToAnchor: self.safeAreaLayoutGuide.topAnchor constant:16],
        [self.userAvatarView.widthAnchor constraintEqualToConstant:60],
        [self.userAvatarView.heightAnchor constraintEqualToConstant:60],
        
        [self.userSubtitleLabel.topAnchor constraintEqualToAnchor: self.userNameLabel.bottomAnchor constant:0],
        [self.userSubtitleLabel.leftAnchor constraintEqualToAnchor: self.leftAnchor constant:16],
        userSubtitleRightToAvatarLeft,
        
    ]];
    
}

@end
