//
//  PickableLabel.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 14.10.2020.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PickableLabel : UILabel<UIPickerViewDataSource, UIPickerViewDelegate, UIToolbarDelegate>  {
    NSArray<NSString*>* items;
}

@property (readonly) NSArray<NSString*>* filteredItems;
@property (nonatomic) UIView *inputView;
@property (nonatomic) UIView *inputAccessoryView;
@property (nonatomic) UIToolbar* toolBar;

@property (nonatomic) UITextView* filterText;
@property (nonatomic) void (^didItemSelected)(NSString*);

- (NSString*)getTitle:(NSInteger)row;
- (void)setItems:(NSArray<NSString*>*)array;
- (void)didChangeFilter:(NSNotification*)notify;

@end

NS_ASSUME_NONNULL_END
