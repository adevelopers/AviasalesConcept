//
//  FlightCell.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 15.10.2020.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlightCell : UITableViewCell

+ (NSString*)reuseId;

@property (nonatomic) UIView* underlayContentView;

@property (nonatomic) CAShapeLayer* flightLineLayer;
@property (nonatomic) CAShapeLayer* separatorLineLayer;

@property (nonatomic) UIImageView* iconImageView;
@property (nonatomic) UIImageView* aircompanyLogoView;

@property (nonatomic, nonnull) UILabel* departureAirportLabel;
@property (nonatomic, nonnull) UILabel* arrivalAirportLabel;

@property (nonatomic, nonnull) UILabel* departureTimeLabel;
@property (nonatomic, nonnull) UILabel* arrivalTimeLabel;

@property (nonatomic, nonnull) UILabel* flightLabel;
@property (nonatomic, nonnull) UILabel* priceLabel;

@end

NS_ASSUME_NONNULL_END
