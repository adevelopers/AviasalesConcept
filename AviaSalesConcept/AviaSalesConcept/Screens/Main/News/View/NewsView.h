//
//  NewsView.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 20.10.2020.
//

#import <UIKit/UIKit.h>
#import "NewsService.h"
#import <YYWebImage/YYWebImage.h>
#import "MainFlow.h"




NS_ASSUME_NONNULL_BEGIN

@interface NewsView : UIView<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic) UICollectionViewFlowLayout* layout;
@property (nonatomic) UICollectionView* collectionView;
@property (nonatomic) id<MainFlow> flow;

@property (copy) NSArray* items;

- (instancetype)initWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
