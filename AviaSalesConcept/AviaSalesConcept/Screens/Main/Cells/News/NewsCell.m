//
//  NewsCell.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 21.10.2020.
//

#import "NewsCell.h"

@implementation NewsCell

+(NSString*)reuseId {
    return @"NewsCell";
}

- (UILabel *)sectionLabel {
    if (_sectionLabel == nil) {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        label.font = [UIFont systemFontOfSize:24 weight:UIFontWeightBold];
        label.textColor = [UIColor colorNamed:@"textPrimary"];
        label.text = @"Новости";
        [label setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
        _sectionLabel = label;
    }
    
    return _sectionLabel;
}

- (UIButton *)moreButton {
    if (_moreButton == nil) {
        UIButton* button = [UIButton new];
        [button setTranslatesAutoresizingMaskIntoConstraints:NO];
        [button setTitle:@"Все новости" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorNamed:@"button"] forState:UIControlStateNormal];
        [button setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
        _moreButton = button;
    }
    
    return _moreButton;
}

- (NewsView *)newsView {
    if (_newsView == nil) {
        NewsView* view = [NewsView new];
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
        _newsView = view;
    }
    
    return _newsView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = UIColor.clearColor;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.sectionLabel];
    [self.contentView addSubview:self.moreButton];
    [self.contentView addSubview:self.newsView];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.sectionLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:32],
        [self.sectionLabel.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:16],
        [self.sectionLabel.rightAnchor constraintEqualToAnchor:self.moreButton.leftAnchor],
        [self.sectionLabel.heightAnchor constraintEqualToConstant:25],
        
        [self.moreButton.bottomAnchor constraintEqualToAnchor:self.sectionLabel.bottomAnchor],
        [self.moreButton.leftAnchor constraintEqualToAnchor:self.sectionLabel.rightAnchor],
        [self.moreButton.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-16],
        [self.moreButton.heightAnchor constraintEqualToConstant:25],
        
        [self.newsView.topAnchor constraintEqualToAnchor:self.sectionLabel.bottomAnchor constant:0],
        [self.newsView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:16],
        [self.newsView.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-16],
        [self.newsView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-16],
    ]];
}

@end
