//
//  SearchResultsViewController.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 15.10.2020.
//

#import "SearchResultsViewController.h"


@interface SearchResultsViewController ()

@end

@implementation SearchResultsViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (instancetype)initWithPresenter:(SearchResultsPresenter*)presenter {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.presenter = presenter;
    }
    return self;
}


- (UITableView *)tableView {
        if (_tableView == nil) {
            UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectZero style: UITableViewStylePlain];
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            [tableView registerClass:NSClassFromString(@"FlightCell") forCellReuseIdentifier:FlightCell.reuseId];
            tableView.dataSource = self;
            tableView.delegate = self;
            tableView.rowHeight = 134+32;
            tableView.backgroundColor = [UIColor colorNamed:@"bg"];
            [tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
            
            _tableView = tableView;
        }
        
        return _tableView;
    }

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Москва - Нью-Йорк";
    self.view.backgroundColor = [UIColor colorNamed:@"searchControlBgEnd"];
    [self.view addSubview: self.tableView];
    
    
    self.tableView.frame = self.view.bounds;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [self.tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor],
        [self.tableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    ]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.tintColor = UIColor.whiteColor;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.tintColor = UIColor.whiteColor;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.presenter.items.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    FlightCell* cell = [tableView dequeueReusableCellWithIdentifier:FlightCell.reuseId];
    
    if (cell) {
//      cell
        return cell;
    }
    
    return [UITableViewCell new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"selected index: %ld", indexPath.row);
}

@end

