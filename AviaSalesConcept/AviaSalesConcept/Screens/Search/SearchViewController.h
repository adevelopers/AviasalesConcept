//
//  SearchViewController.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 14.10.2020.
//

#import <UIKit/UIKit.h>
#import "SearchControl.h"
#import "SegmentControl.h"
#import "SearchCellModel.h"



NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : UIViewController<UITableViewDataSource>

@property (nonatomic, nonnull) SearchControl* searchControl;
@property (nonatomic, nonnull) SegmentControl* segmentControl;

@property (nonatomic, nonnull) UITableView* tableView;

@property (nonatomic) NSArray<NSNumber*>* cellModels;

@property (nonatomic) UIButton* searchButton;


@end

NS_ASSUME_NONNULL_END
