//
//  RestorantsViewController.h
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 11.10.2020.
//

#import <UIKit/UIKit.h>
#import "Models.h"

NS_ASSUME_NONNULL_BEGIN

@interface RestorantsViewController : UIViewController<UICollectionViewDataSource>

@property (nonatomic, nonnull) UICollectionViewFlowLayout* layout;
@property (nonatomic, nonnull) UICollectionView* collectionView;

@property (nonatomic) NSMutableArray<Restaurant*>* items;

@end

NS_ASSUME_NONNULL_END
