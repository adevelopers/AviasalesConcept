//
//  ServiceCell.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 21.10.2020.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ServiceCell : UITableViewCell

+(NSString*)reuseId; 

@property (nonatomic) UIButton* flightsButton;
@property (nonatomic) UIButton* restorantsButton;
@property (nonatomic) UIStackView* servicesStackView;

- (void)setupButtons:(nullable id)target and:(SEL)a and:(SEL)b;

@end

NS_ASSUME_NONNULL_END
