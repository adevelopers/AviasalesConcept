//
//  NewsView.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 20.10.2020.
//

#import "NewsView.h"
#import "NewsItemCell.h"



@implementation NewsView

- (UICollectionViewFlowLayout *)layout {
    if (_layout == nil) {
        _layout = [UICollectionViewFlowLayout new];
        _layout.itemSize = CGSizeMake(142, 185);
        _layout.minimumInteritemSpacing = 8;
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    
    return _layout;
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionView* collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout: self.layout];
        [collectionView registerClass:[NewsItemCell class] forCellWithReuseIdentifier: NewsItemCell.reuseId];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.backgroundColor = UIColor.grayColor;
        collectionView.showsHorizontalScrollIndicator = NO;
        [collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
        _collectionView = collectionView;
    }
    
    return _collectionView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = UIColor.clearColor;
    [self addSubview:self.collectionView];
    self.collectionView.backgroundColor = UIColor.clearColor;
    [NSLayoutConstraint activateConstraints:@[
        [self.collectionView.topAnchor constraintEqualToAnchor:self.topAnchor constant:8],
        [self.collectionView.leftAnchor constraintEqualToAnchor:self.leftAnchor],
        [self.collectionView.rightAnchor constraintEqualToAnchor:self.rightAnchor],
        [self.collectionView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
    ]];
    
    [self loadNews];
}

- (void)loadNews {
    [[NewsService shared] loadFeed:^(NSArray* items) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.items = items;
            [self.collectionView reloadData];
        });
    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NewsItemCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:NewsItemCell.reuseId forIndexPath: indexPath];
    NewsItem* model = self.items[indexPath.row];
    if (cell) {
        cell.backgroundColor = UIColor.whiteColor;
        cell.titleLabel.text = model.title;
        cell.imageView.yy_imageURL = [NSURL URLWithString:model.urlToImage];
        return cell;
    }
    
    return [UICollectionViewCell new];
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsItem* model = self.items[indexPath.row];
    NSLog(@"model %@", model.title);
    [self.flow showNewsDetail:model];
}

@end


