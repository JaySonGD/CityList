//
//  TableViewCell1.m
//  九宫格
//
//  Created by czljcb on 16/4/17.
//  Copyright © 2016年 DeanXChen. All rights reserved.
//

#import "TableViewCell1.h"
#import "DXCitySection.h"

@interface TableViewCell1 () <UICollectionViewDelegate,UICollectionViewDataSource>


@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height;

@end

@implementation TableViewCell1

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
   UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*) self.collectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake(315 /3,44);
//    layout.minimumLineSpacing =10;
//    layout.minimumInteritemSpacing =10;
    self.collectionView.contentInset = UIEdgeInsetsMake(10, 10, 10, 0);

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.item.cities.count ;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (void)setItem:(DXCitySection *)item
{
    _item = item;
    self.height.constant = (item.cities.count + 2) / 3 * 44+ (item.cities.count + 2)/ 3 *10 + 10;
    [self.collectionView reloadData];
}

@end
