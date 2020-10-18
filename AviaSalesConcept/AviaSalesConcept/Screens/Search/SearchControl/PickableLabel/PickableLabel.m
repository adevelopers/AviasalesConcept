//
//  PickableLabel.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 14.10.2020.
//

#import "PickableLabel.h"


@implementation PickableLabel

- (UIToolbar*)toolBar {
    if (_toolBar == nil) {
        UIToolbar* view = [UIToolbar new];
        view.barStyle = UIBarStyleDefault;
        view.tintColor = UIColor.blackColor;
        view.backgroundColor = UIColor.whiteColor;
        view.barTintColor = UIColor.whiteColor;
        view.delegate = self;
        
//        UIToolbar.appearance.barStyle = UIBarStyleBlack;
        
        [view setItems:@[
            [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
            [[UIBarButtonItem alloc] initWithTitle:@"Готово" style:UIBarButtonItemStyleDone target:self action:@selector(didTapDone)]
        ]];
        
        [_toolBar setTranslatesAutoresizingMaskIntoConstraints:YES];
        _toolBar = view;
    }
    return _toolBar;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        UIPickerView *datePicker = [[UIPickerView alloc] init];
        datePicker.dataSource = self;
        datePicker.delegate = self;
        datePicker.backgroundColor = UIColor.whiteColor;
        datePicker.tintColor = UIColor.blackColor;
        datePicker.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
        
        [self setInputView:datePicker];
        [self setInputAccessoryView: self.toolBar];
        
        UITapGestureRecognizer *tapper = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(launchPicker:)];
        [self addGestureRecognizer:tapper];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.toolBar sizeToFit];
}

- (BOOL)isUserInteractionEnabled {
    return YES;
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)launchPicker:(UITapGestureRecognizer *) tapper {
    [self becomeFirstResponder];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return items.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self getTitle:row];
}

- (NSString*)getTitle:(NSInteger)row {
    NSString* value = items[row];
    if (value) {
        return value;
    } else {
        return @"";
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSString* value = [self getTitle:row];
    self.didItemSelected(value);
}


- (void)didTapDone {
    [self resignFirstResponder];
}

- (void)setItems:(NSArray<NSString*>*)array {
    items = array;
}

@end
