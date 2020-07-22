//
//  ViewModel.h
//  CollectionViewRookie
//
//  Created by Alan Ai on 2020/7/22.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewCellViewModel : NSObject

@property (nonatomic, copy, nullable) NSString *thumbImageUrl;
@property (nonatomic, copy) NSString *effectName;
@property (nonatomic, assign) unsigned int uid;

@property (nonatomic, assign) BOOL selected;
@property (nonatomic, assign) BOOL placeholderItem; //用以插入模板列表的第一个，无特效，空白站位的item
@property (nonatomic, assign) BOOL isVipEffectTheme; // 是否VIP主题
@property (nonatomic, assign) BOOL isDefaultEffect;

@end

NS_ASSUME_NONNULL_END
