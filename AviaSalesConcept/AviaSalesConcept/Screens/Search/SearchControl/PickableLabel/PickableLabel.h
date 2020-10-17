//
//  PickableLabel.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 14.10.2020.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PickableLabel : UILabel<UIPickerViewDataSource, UIPickerViewDelegate> 
    @property (readwrite) UIView *inputView;
    @property (readwrite) UIView *inputAccessoryView;
    @property (nonatomic) UIToolbar* toolBar;

    @property (nonatomic) void (^didItemSelected)(NSString*);


    - (NSString*)getTitle:(NSInteger)row;
@end

NS_ASSUME_NONNULL_END
