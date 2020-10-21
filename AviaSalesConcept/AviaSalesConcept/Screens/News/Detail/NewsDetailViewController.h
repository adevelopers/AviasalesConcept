//
//  NewsDetailViewController.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 21.10.2020.
//

#import <UIKit/UIKit.h>
#import "NewsItem.h"
#import <YYWebImage/YYWebImage.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsDetailViewController : UIViewController

@property (nonatomic) UIImageView* imageView;
@property (nonatomic) UILabel* contentLabel;

- (void) setup:(NewsItem*)item;

@end

NS_ASSUME_NONNULL_END
