//
//  ProfileCell.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 20.10.2020.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProfileCell : UITableViewCell

+ (NSString*)reuseId; 

@property (nonatomic) UILabel* userNameLabel;
@property (nonatomic) UIImageView* userAvatarView;
@property (nonatomic) UILabel* userSubtitleLabel;

@end

NS_ASSUME_NONNULL_END
