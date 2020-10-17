//
//  RestaurantCell.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 12.10.2020.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RestaurantCell : UICollectionViewCell

@property (nonatomic, nonnull) UIImageView* logoView;


- (void)setImage:(UIImage*)image;

@end

NS_ASSUME_NONNULL_END
