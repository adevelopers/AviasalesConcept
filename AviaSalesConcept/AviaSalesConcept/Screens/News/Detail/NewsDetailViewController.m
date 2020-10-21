//
//  NewsDetailViewController.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 21.10.2020.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

- (UIImageView *)imageView {
    if (_imageView == nil) {
        UIImageView* view = [UIImageView new];
        view.contentMode = UIViewContentModeScaleAspectFit;
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
        _imageView = view;
    }
    
    return _imageView;
}

- (UILabel *)contentLabel {
    if (_contentLabel == nil) {
        UILabel* label = [UILabel new];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        label.textColor = UIColor.blackColor;
        label.numberOfLines = 0;
        _contentLabel = label;
    }
    
    return _contentLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.contentLabel];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.imageView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.imageView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor],
        [self.imageView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor],
        [self.imageView.heightAnchor constraintEqualToConstant: 357],
        
        [self.contentLabel.topAnchor constraintEqualToAnchor:self.imageView.bottomAnchor constant:6],
        [self.contentLabel.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:16],
        [self.contentLabel.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-16],
    ]];
    
}

- (void)setup:(NewsItem*)item {
    self.title = item.title;
    self.imageView.yy_imageURL = [NSURL URLWithString:item.urlToImage];
    self.contentLabel.text = item.content;
}

@end
