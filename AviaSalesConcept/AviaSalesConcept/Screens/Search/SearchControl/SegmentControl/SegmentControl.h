//
//  SegmentControl.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 15.10.2020.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SegmentControl : UIControl

@property (copy) NSArray<UIButton*>* buttons;

@property (nonatomic, nonnull) UIButton* selectedButton;

@end

NS_ASSUME_NONNULL_END
