//
//  DatePickerCell.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 15.10.2020.
//

#import "DatePickerCell.h"
#import "DateHelper.h"

@implementation DatePickerCell

+ (NSString*)reuseId {
    return @"DatePickerCell";
}

- (UIImageView *)iconImageView {
    if (_iconImageView == nil) {
        UIImageView* view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"datePicker"]];
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
        _iconImageView = view;
    }
    
    return _iconImageView;
}

- (UILabel *)captionLabel {
    if (_captionLabel == nil) {
        UILabel* label = [UILabel new];
        label.text = @"Дата отлёта";
        label.textColor = [UIColor colorNamed:@"searchFormCaption"];
        label.font = [UIFont systemFontOfSize:12 weight:UIFontWeightBold];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        _captionLabel = label;
    }
    
    return _captionLabel;
}

- (UILabel *)valueLabel {
    if (_valueLabel == nil) {
        UILabel* label = [UILabel new];
        label.text = @"Mon, 14 Dec";
        label.textColor = [UIColor colorNamed:@"searchFormValue"];
        label.font = [UIFont systemFontOfSize:16 weight:UIFontWeightBold];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        _valueLabel = label;
    }
    
    return _valueLabel;
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
            [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
            [[UIBarButtonItem alloc] initWithTitle:@"Готово" style:UIBarButtonItemStyleDone target:self action:@selector(didTapDone)]
        ]];
        
        [_toolBar setTranslatesAutoresizingMaskIntoConstraints:YES];
        _toolBar = view;
    }
    return _toolBar;
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = UIColor.whiteColor;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self addSubview:self.iconImageView];
    [self addSubview:self.captionLabel];
    [self addSubview:self.valueLabel];
    
    [NSLayoutConstraint activateConstraints:@[
        [_iconImageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
        [_iconImageView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:21],
        
        [_captionLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:5],
        [_captionLabel.leftAnchor constraintEqualToAnchor:self.iconImageView.rightAnchor constant:20],
        
        [_valueLabel.topAnchor constraintEqualToAnchor:self.captionLabel.bottomAnchor constant:5],
        [_valueLabel.leftAnchor constraintEqualToAnchor:self.iconImageView.rightAnchor constant:20],
    ]];
    
    [self setupDatePicker];
    
    UITapGestureRecognizer *tapper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(launchPicker:)];
    [self addGestureRecognizer:tapper];
}

- (void)setupDatePicker {
    
    UIDatePicker *datePicker = [UIDatePicker new];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker setPreferredDatePickerStyle: UIDatePickerStyleCompact];
    datePicker.backgroundColor = UIColor.whiteColor;
    datePicker.tintColor = UIColor.blackColor;
    datePicker.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
    [datePicker setLocale: [[NSLocale alloc] initWithLocaleIdentifier:@"ru-RU"]];
    [datePicker setMinimumDate: [NSDate now]];
    [datePicker addTarget:self action:@selector(didTapDone) forControlEvents: UIControlEventValueChanged];
    
    [self setInputView:datePicker];
    [self setInputAccessoryView: self.toolBar];
}

- (void)setupCaption:(NSString*)caption andValue:(NSString*)value {
    
    self.captionLabel.text = caption;
    self.valueLabel.text = value;
    
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

- (void)didTapDone {
    NSDate* selectedDate = ((UIDatePicker*)self.inputView).date;
    
    if (selectedDate && self.didItemSelected) {
        self.didItemSelected(selectedDate);
        NSString* dateString = [[DateHelper dateFormatter] stringFromDate:selectedDate];
        self.valueLabel.text = dateString;
        NSLog(@"selected Date: %@", dateString);
    }
    [self resignFirstResponder];
}


@end
