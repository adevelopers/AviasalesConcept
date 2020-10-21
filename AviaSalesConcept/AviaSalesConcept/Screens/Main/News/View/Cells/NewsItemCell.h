//
//  NewsItemCell.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 21.10.2020.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsItemCell : UICollectionViewCell

+ (NSString*)reuseId;

@property (nonatomic) UIImageView* imageView;
@property (nonatomic) UILabel* titleLabel;

@end

NS_ASSUME_NONNULL_END
