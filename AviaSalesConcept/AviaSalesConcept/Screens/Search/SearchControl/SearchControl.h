//
//  SearchControl.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 14.10.2020.
//

#import <UIKit/UIKit.h>
#import "PickableLabel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchControl : UIControl

@property (nonatomic, nonnull) UIImageView* backImageView;
@property (nonatomic, nonnull) UIButton* switchButton;

@property (nonatomic, nonnull) UILabel* departureCaptionLabel;
@property (nonatomic, nonnull) UILabel* arrivalCaptionLabel;

@property (nonatomic, nonnull) PickableLabel* departureAirportLabel;
@property (nonatomic, nonnull) PickableLabel* arrivalAirportLabel;



@end

NS_ASSUME_NONNULL_END
