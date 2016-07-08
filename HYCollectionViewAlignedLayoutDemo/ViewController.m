//
//  ViewController.m
//  HYCollectionViewAlignedLayoutDemo
//
//  Created by 李思良 on 16/6/26.
//  Copyright © 2016年 lsl. All rights reserved.
//

#import "ViewController.h"
#import "HYCollectViewAlignedLayout.h"

static NSString * const kCellIdentifier = @"CellIdentifier";

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    HYCollectViewAlignedLayout *layout = [[HYCollectViewAlignedLayout alloc] initWithType:HYCollectViewAlignLeft];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-20, self.view.frame.size.height - 100) collectionViewLayout:layout];
    [self.view addSubview:collectionView];
     [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier];
    collectionView.backgroundColor = [UIColor clearColor];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(0, 50);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(0, 50);
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView =nil;
    
    if (kind ==UICollectionElementKindSectionHeader) {
        //定制头部视图的内容
        UICollectionReusableView *headerV = (UICollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"forIndexPath:indexPath];
        headerV.backgroundColor = [UIColor yellowColor];
        reusableView = headerV;
    }
    if (kind ==UICollectionElementKindSectionFooter){
        UICollectionReusableView *footerV = (UICollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView"forIndexPath:indexPath];
        footerV.backgroundColor = [UIColor blueColor];
        reusableView = footerV;
    }
    return reusableView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell.contentView.layer.borderColor = [UIColor greenColor].CGColor;
    cell.contentView.layer.borderWidth = 2;
    
    return cell;
}

#pragma mark - UICollectionViewDelegateLeftAlignedLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(((indexPath.row * 35) % 120) + 60, 60);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 25;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}


@end
