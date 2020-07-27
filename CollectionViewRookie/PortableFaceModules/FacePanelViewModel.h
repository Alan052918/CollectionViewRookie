//
//  FacePanelViewModel.h
//  CollectionViewRookie
//
//  Created by Alan on 2020/7/27.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class FaceCellViewModel;
@interface FacePanelViewModel : NSObject

- (NSInteger)countViewModels;
- (FaceCellViewModel *)cellViewModelForItemAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
