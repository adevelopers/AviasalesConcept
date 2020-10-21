//
//  ViewController.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 10.10.2020.
//

#import "MainViewController.h"
#import "RestorantsViewController.h"
#import "SearchViewController.h"
#import "ProfileCell.h"
#import "ServiceCell.h"
#import "NewsCell.h"
#import "NewsDetailViewController.h"


#define MAIN_SECTION_PROFILE  1
#define MAIN_SECTION_SERVICES  2
#define MAIN_SECTION_NEWS  3


@interface MainViewController ()
@property (nonatomic) NSArray<NSNumber*>* sections;
@end

@implementation MainViewController

- (UITableView *)tableView {
    if (_tableView == nil) {
        UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        tableView.dataSource = self;
        tableView.delegate = self;

        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [tableView registerClass:[ProfileCell class] forCellReuseIdentifier: ProfileCell.reuseId];
        [tableView registerClass:[ServiceCell class] forCellReuseIdentifier:ServiceCell.reuseId];
        [tableView registerClass:[NewsCell class] forCellReuseIdentifier:NewsCell.reuseId];
        _tableView = tableView;
    }
    
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = UIColor.blackColor;
    self.view.backgroundColor = [UIColor colorNamed:@"bg"];
    [self.view addSubview:self.tableView];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:0],
        [self.tableView.leftAnchor constraintEqualToAnchor: self.view.leftAnchor],
        [self.tableView.rightAnchor constraintEqualToAnchor: self.view.rightAnchor],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
    ]];
    
    [self loadData];
}

- (void)loadData {
    self.sections = @[
        @(MAIN_SECTION_PROFILE),
        @(MAIN_SECTION_SERVICES),
        @(MAIN_SECTION_NEWS)
    ];
    
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
}

- (void) didTap {
    NSLog(@"did tap");
    RestorantsViewController* controller = [RestorantsViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void) didTapSearch {
    NSLog(@"did tap search");
    SearchViewController* controller = [SearchViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.sections.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (self.sections[indexPath.row].intValue) {
        case MAIN_SECTION_PROFILE: {
            ProfileCell* cell = [tableView dequeueReusableCellWithIdentifier:ProfileCell.reuseId];
            if (cell) {
                return cell;
            }
        } break;
        case MAIN_SECTION_SERVICES: {
            ServiceCell* cell = [tableView dequeueReusableCellWithIdentifier:ServiceCell.reuseId];
            if (cell) {
                [cell setupButtons:self
                               and:@selector(didTapSearch)
                               and:@selector(didTap)];
                return cell;
            }
        } break;
        case MAIN_SECTION_NEWS: {
            NewsCell* cell = [tableView dequeueReusableCellWithIdentifier:NewsCell.reuseId];
            cell.autoresizingMask = UIViewAutoresizingFlexibleHeight && UIViewAutoresizingFlexibleWidth;
            if (cell) {
                cell.newsView.flow = self;
                return cell;
            }
        } break;
        default:
            break;
    }
    
    return [UITableViewCell new];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (self.sections[indexPath.row].intValue) {
        case MAIN_SECTION_PROFILE:
            return 120;
        case MAIN_SECTION_SERVICES:
            return 70;
        case MAIN_SECTION_NEWS:
            return 238;
        default:
            return 0;
    }
}


#pragma mark - MainFlow

- (void)showNewsDetail:(NewsItem *)item {
    NewsDetailViewController* controller = [NewsDetailViewController new];
    [controller setup:item];
    [self.navigationController pushViewController:controller animated:YES];
}

@end




