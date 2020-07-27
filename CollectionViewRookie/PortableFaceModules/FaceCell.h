//
//  CollectionViewCell.h
//  CollectionViewRookie
//
//  Created by Alan Ai on 2020/7/22.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FaceCellViewModel;
@interface FaceCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *faceNameLabel;
@property (nonatomic, strong) UILabel *downloadProgressLabel;
@property (nonatomic, strong) UIView *downloadProgressMask;
@property (nonatomic, strong) UIImageView *thumbImageView;

@end

NS_ASSUME_NONNULL_END
