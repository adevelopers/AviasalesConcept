//
//  SearchViewController.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 14.10.2020.
//

#import "SearchViewController.h"
#import "DatePickerCell.h"
#import "PickerCell.h"
#import "SearchResultsViewController.h"
#import "DataManager.h"


@interface SearchViewController ()

@end

@implementation SearchViewController

- (NSArray<NSNumber *> *)cellModels {
    return @[
        @(kSearchCellModel_DepartureDate),
        @(kSearchCellModel_ArrivalDate),
        @(kSearchCellModel_Passenger),
        @(kSearchCellModel_Class),
    ];
}

- (SearchControl*)searchControl {
    
    if (_searchControl == nil) {
        SearchControl* control = [SearchControl new];
        [control setTranslatesAutoresizingMaskIntoConstraints:NO];
        _searchControl = control;
    }
    
    return _searchControl;
}

- (SegmentControl *)segmentControl {
    if (_segmentControl == nil) {
        SegmentControl* control = [SegmentControl new];
        control.backgroundColor = UIColor.whiteColor;
        [control setTranslatesAutoresizingMaskIntoConstraints:NO];
        _segmentControl = control;
    }
    
    return _segmentControl;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        UITableView* view = [[UITableView alloc] initWithFrame:CGRectZero style: UITableViewStylePlain];
        view.layer.cornerRadius = 4;
        view.separatorStyle = UITableViewCellSeparatorStyleNone;
        [view registerClass:NSClassFromString(@"DatePickerCell") forCellReuseIdentifier:DatePickerCell.reuseId];
        [view registerClass:NSClassFromString(@"PickerCell") forCellReuseIdentifier:PickerCell.reuseId];
        view.dataSource = self;
        view.rowHeight = 60;
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
        view.backgroundColor = UIColor.whiteColor;
        // Shadow
        view.layer.borderColor = UIColor.blackColor.CGColor;
        view.layer.borderWidth = 0.1;
        
        _tableView = view;
    }
    
    return _tableView;
}

- (UIButton *)searchButton {
    if (_searchButton == nil) {
        UIButton* button = [UIButton new];
        [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [button setTitle:@"Подобрать рейсы" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
        button.backgroundColor = [UIColor colorNamed:@"button"];
        [button addTarget:self action:@selector(didTapSearchFlights) forControlEvents:UIControlEventTouchUpInside];
        [button setTranslatesAutoresizingMaskIntoConstraints:NO];
        _searchButton = button;
    }
    
    return _searchButton;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDarkContent;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    self.view.backgroundColor = [UIColor colorNamed:@"bg"];
    [self.view addSubview:self.searchControl];
    [self.view addSubview:self.segmentControl];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.searchButton];
    
    [self.navigationController setNavigationBarHidden:YES];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTranslucent:YES];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.tintColor = UIColor.whiteColor;
    self.navigationController.navigationBar.titleTextAttributes = @{
        NSForegroundColorAttributeName: UIColor.whiteColor
    };
    
    self.navigationItem.title = @"Поиск рейсов";
        
    [NSLayoutConstraint activateConstraints:@[
        [_searchControl.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [_searchControl.leftAnchor constraintEqualToAnchor:self.view.leftAnchor],
        [_searchControl.rightAnchor constraintEqualToAnchor:self.view.rightAnchor],
        [_searchControl.heightAnchor constraintEqualToConstant:320],
        
        [_segmentControl.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:16],
        [_segmentControl.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-16],
        [_segmentControl.centerYAnchor constraintEqualToAnchor:self.searchControl.bottomAnchor],
        [_segmentControl.heightAnchor constraintEqualToConstant:57],
        
        [_tableView.topAnchor constraintEqualToAnchor: _segmentControl.bottomAnchor constant:16],
        [_tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:16],
        [_tableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-16],
        [_tableView.heightAnchor constraintEqualToConstant:(60*4+8)],
        
        [_searchButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        [_searchButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor],
        [_searchButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor],
        [_searchButton.heightAnchor constraintEqualToConstant:57],
    ]];
    
    [self loadAirports];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.searchControl.backImageView.image = [UIImage imageNamed:@"search_map"];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // чистим ресурсы чтобы небыло sideeffects
    self.searchControl.backImageView.image = nil;
}

- (void)loadAirports {
    SearchViewController* _self = self;
    __block NSMutableArray<NSString*>* airportTitles = [NSMutableArray new];
    [[DataManager shared] loadAirportsWithCompletion:^(NSArray<Airport*>* airports) {
        for (Airport* airport in airports) {
            NSString* airportCode = [airport valueForKey:@"code"];
            if (airport != nil) {
                [airportTitles addObject:airportCode];
            }
        }
        [_self.searchControl setAirports:airportTitles];
    }];
}

- (void)didTapSearchFlights {
    SearchResultsViewController* controller = [[SearchResultsViewController alloc] initWithPresenter: [SearchResultsPresenter new]];
    [self.navigationController pushViewController:controller animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.cellModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SearchCellModel cellModel = self.cellModels[indexPath.row].intValue;
    
    switch (cellModel) {
        case kSearchCellModel_DepartureDate: {
            DatePickerCell* cell = (DatePickerCell*)[tableView dequeueReusableCellWithIdentifier: DatePickerCell.reuseId];
            if (cell) {
                [cell setupCaption:@"Дата отлёта" andValue:@"12 октября"];
                return cell;
            }
        }
        case kSearchCellModel_ArrivalDate: {
            DatePickerCell* cell = (DatePickerCell*)[tableView dequeueReusableCellWithIdentifier: DatePickerCell.reuseId];
            if (cell) {
                [cell setupCaption:@"Дата прилёта" andValue:@"13 октября"];
                return cell;
            }
        }
        case kSearchCellModel_Passenger: {
            PickerCell* cell = (PickerCell*)[tableView dequeueReusableCellWithIdentifier: PickerCell.reuseId];
            if (cell) {
                [cell setupIcon:[UIImage imageNamed:@"passenger"] andCaption:@"Пассажиры" andValue:@"1 Взрослый 0 детский "];
                return cell;
            }
        }
        case kSearchCellModel_Class: {
            PickerCell* cell = (PickerCell*)[tableView dequeueReusableCellWithIdentifier: PickerCell.reuseId];
            if (cell) {
                [cell setupIcon:[UIImage imageNamed:@"passengerClass"] andCaption:@"Класс" andValue:@"Бизнес"];
                return cell;
            }
        }
        default:
            return [UITableViewCell new];
    }
}



@end
