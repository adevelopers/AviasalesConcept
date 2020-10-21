//
//  ViewController.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 10.10.2020.
//

#import <UIKit/UIKit.h>
#import "MainFlow.h"



@interface MainViewController : UIViewController<UITableViewDataSource, MainFlow>

@property (nonatomic) UITableView* tableView;

@end

@interface MainViewController(TableView)<UITableViewDelegate>

@end
