//
//  FacePanelView.h
//  CollectionViewRookie
//
//  Created by Alan on 2020/7/27.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FacePanelView, Face, FacePanelViewModel;
@protocol FacePanelDelegate <NSObject>

- (void)facePanelView:(FacePanelView *)facePanelView didSelectFace:(Face *)face;
- (void)facePanelView:(FacePanelView *)facePanelView updateWithViewModel:(NSObject *)viewModel;

@optional
- (BOOL)addFaceDownloadProgressObserver:(NSObject *)observer;
- (BOOL)removeFaceDownloadProgressObserver:(NSObject *)observer;

@end

@protocol FacePanelDataSource <NSObject>



@end

@interface FacePanelView : UIView

@property (nonatomic, assign) Class cellClass;
@property (nonatomic, assign) BOOL enableLoadMore;
@property (nonatomic, strong) Face *defaultFace;
@property (nonatomic, strong, nullable) Face *selectedFace;
@property (nonatomic, strong) id <FacePanelDelegate> delegate;

- (void)updateFacePanel;

- (void)registerCellClass:(Class)cellClass;

@end

NS_ASSUME_NONNULL_END
