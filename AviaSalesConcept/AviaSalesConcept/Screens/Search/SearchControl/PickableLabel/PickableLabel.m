//
//  PickableLabel.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 14.10.2020.
//

#import "PickableLabel.h"


@implementation PickableLabel

- (NSArray<NSString *> *)filteredItems {
    if (self.filterText.text.length > 0) {
        return [items filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", self.filterText.text]];
    } else {
        return items;
    }
    
}

- (UITextView *)filterText {
    if (_filterText == nil) {
        UITextView* field = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 150, 25)];
        field.text = @"";
        field.layer.cornerRadius = 4;
        field.layer.borderColor = [UIColor.blackColor colorWithAlphaComponent:0.3].CGColor;
        field.layer.borderWidth = 1;
        field.contentInset = UIEdgeInsetsMake(0, 8, 0, 8);
        field.clearsOnInsertion = NO;
        field.autocorrectionType = UITextAutocorrectionTypeNo;
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(didChangeFilter:)
                   name:UITextViewTextDidChangeNotification
                 object:nil];
        
        
        _filterText = field;
    }
    
    return _filterText;
}

- (UIToolbar*)toolBar {
    if (_toolBar == nil) {
        UIToolbar* view = [UIToolbar new];
        view.barStyle = UIBarStyleDefault;
        view.tintColor = UIColor.blackColor;
        view.backgroundColor = UIColor.whiteColor;
        view.barTintColor = UIColor.whiteColor;
        view.delegate = self;
        
        [view setItems:@[
            [[UIBarButtonItem alloc] initWithCustomView:self.filterText],
            [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
            [[UIBarButtonItem alloc] initWithTitle:@"Готово" style:UIBarButtonItemStyleDone target:self action:@selector(didTapDone)]
        ]];
        
        [_toolBar setTranslatesAutoresizingMaskIntoConstraints:YES];
        _toolBar = view;
    }
    return _toolBar;
}


- (instancetype)init {
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
    return self.filteredItems.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self getTitle:row];
}

- (NSString*)getTitle:(NSInteger)row {
    NSString* value = self.filteredItems[row];
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


- (void)didChangeFilter:(NSNotification*)notify {
    NSLog(@"filter changed to %@", ((UITextView*)notify.object).text );
}
@end
