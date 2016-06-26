//
//  HYCollectViewAlignedLayout.h
//  HYCollectionViewAlignedLayoutDemo
//
//  Created by 李思良 on 16/6/26.
//  Copyright © 2016年 lsl. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HYCollectViewAlignType) {
    HYCollectViewAlignLeft,
    HYCollectViewAlignMiddle,
    HYCollectViewAlignRight,
};

@interface HYCollectViewAlignedLayout : UICollectionViewFlowLayout

@property (nonatomic, readonly) HYCollectViewAlignType alignType;

- (instancetype)initWithType:(HYCollectViewAlignType)type;

@end
