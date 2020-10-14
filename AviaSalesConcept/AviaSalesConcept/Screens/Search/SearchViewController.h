//
//  SearchViewController.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 14.10.2020.
//

#import <UIKit/UIKit.h>
#import "SearchControl.h"
#import "SegmentControl.h"


NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : UIViewController

@property (nonatomic, nonnull) SearchControl* searchControl;
@property (nonatomic, nonnull) SegmentControl* segmentControl;


@end

NS_ASSUME_NONNULL_END
