//
//  RestorantsViewController.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 11.10.2020.
//

#import "RestorantsViewController.h"
#import "RestaurantCell.h"

@interface RestorantsViewController ()

@end

@implementation RestorantsViewController

- (UICollectionViewFlowLayout*)layout {
    if (_layout == nil) {
        UICollectionViewFlowLayout* layout = [UICollectionViewFlowLayout new];
        layout.itemSize = CGSizeMake(124, 100);
        layout.sectionInset = UIEdgeInsetsMake(8, 16, 16, 16);
        layout.minimumLineSpacing = 16;
        layout.minimumInteritemSpacing = 16;
        _layout = layout;
    }
    
    return _layout;
}

- (UICollectionView*)collectionView {
    
    if (_collectionView == nil) {
        UICollectionView* view = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout: self.layout];
        [view registerClass:NSClassFromString(@"RestaurantCell") forCellWithReuseIdentifier:@"cell"];
        view.dataSource = self;
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
        _collectionView = view;
    }
    
    return _collectionView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.items = (NSMutableArray<Restaurant*>*) @[
            [[Restaurant alloc] initWithName:@"mc"],
            [[Restaurant alloc] initWithName:@"bk"],
            [[Restaurant alloc] initWithName:@"jco"],
            [[Restaurant alloc] initWithName:@"len"]
        ];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorNamed:@"bg"];
    self.title = @"Рестораны";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAlways;
    self.navigationController.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAlways;
    
    [self.view addSubview: self.collectionView];
    
    self.collectionView.backgroundColor = [UIColor colorNamed:@"bg"];
    
    [NSLayoutConstraint activateConstraints:@[
        [_collectionView.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor],
        [_collectionView.leftAnchor constraintEqualToAnchor: self.view.leftAnchor],
        [_collectionView.rightAnchor constraintEqualToAnchor: self.view.rightAnchor],
        [_collectionView.bottomAnchor constraintEqualToAnchor: self.view.bottomAnchor],
    ]];
    
    [_collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _items.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RestaurantCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    if (cell != nil) {
        cell.backgroundColor = UIColor.whiteColor;
        Restaurant* model = _items[indexPath.row];
        
        if (model) {
            [cell setImage:[UIImage imageNamed:model.imageName]];
        }
        return cell;
    }
    
    return [UICollectionViewCell new];
}

@end
