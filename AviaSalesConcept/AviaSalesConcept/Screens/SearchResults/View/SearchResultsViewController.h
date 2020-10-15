//
//  SearchResultsViewController.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 15.10.2020.
//

#import <UIKit/UIKit.h>
#import "SearchResultsPresenter.h"
#import "FlightCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchResultsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, readwrite) SearchResultsPresenter* presenter;

@property (nonatomic) UITableView* tableView;

- (instancetype)initWithPresenter:(SearchResultsPresenter*)presenter;

@end

NS_ASSUME_NONNULL_END
