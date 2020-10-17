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

// TODO: Вынести SwitchControl в отдельную компоненту
@property (nonatomic, nonnull) UIButton* switchButton;
@property (nonatomic, nonnull) CAShapeLayer* highDot;
@property (nonatomic, nonnull) CAShapeLayer* lowerDot;
@property (nonatomic, nonnull) CAShapeLayer* highLine;
@property (nonatomic, nonnull) CAShapeLayer* lowerLine;
// End of Switch Control

@property (nonatomic, nonnull) UIImageView* backImageView;


@property (nonatomic, nonnull) UILabel* departureCaptionLabel;
@property (nonatomic, nonnull) UILabel* arrivalCaptionLabel;

@property (nonatomic, nonnull) PickableLabel* departureAirportLabel;
@property (nonatomic, nonnull) PickableLabel* arrivalAirportLabel;

@property (nonatomic, nonnull) UILabel* departureCityLabel;
@property (nonatomic, nonnull) UILabel* arrivalCityLabel;

@end

NS_ASSUME_NONNULL_END
