//
//  DatePickerCell.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 15.10.2020.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DatePickerCell : UITableViewCell

+ (NSString*)reuseId;

@property (readwrite) UIView *inputView;
@property (readwrite) UIView *inputAccessoryView;
@property (nonatomic) UIToolbar* toolBar;

@property (nonatomic) UIImageView* iconImageView;
@property (nonatomic) UILabel* captionLabel;
@property (nonatomic) UILabel* valueLabel;

@property (nonatomic) void (^didItemSelected)(NSDate*);



- (void)setupCaption:(NSString*)caption andValue:(NSString*)value;



@end

NS_ASSUME_NONNULL_END


@interface DatePickerCell (PickerToolBar) <UIToolbarDelegate>

@end
