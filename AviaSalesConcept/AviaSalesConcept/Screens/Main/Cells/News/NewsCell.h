//
//  NewsCell.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 21.10.2020.
//

#import <UIKit/UIKit.h>
#import "NewsView.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsCell : UITableViewCell

+ (NSString*)reuseId;

@property (nonatomic) UILabel* sectionLabel;
@property (nonatomic) UIButton* moreButton;

@property (nonatomic) NewsView* newsView;

@end

NS_ASSUME_NONNULL_END
