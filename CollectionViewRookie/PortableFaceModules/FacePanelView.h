//
//  FacePanelView.h
//  CollectionViewRookie
//
//  Created by Alan on 2020/7/27.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FacePanelView, FaceCell, FacePanelViewModel;
@protocol FacePanelDelegate <NSObject>

- (void)facePanelView:(FacePanelView *)facePanelView didSelectFaceCellAtIndexPath:(nonnull NSIndexPath *)indexPath;

@optional
- (BOOL)addFaceDownloadProgressObserver:(NSObject *)observer;
- (BOOL)removeFaceDownloadProgressObserver:(NSObject *)observer;

@end

@protocol FacePanelDataSource <NSObject>

- (NSInteger)countFaces;
- (void)updateViewModelForCell:(UICollectionViewCell *)cell atIndexPath:(nonnull NSIndexPath *)indexPath;

@end

@interface FacePanelView : UIView

@property (nonatomic, assign) Class cellClass;
@property (nonatomic, assign) BOOL enableLoadMore;
@property (nonatomic, strong) id <FacePanelDelegate> delegate;
@property (nonatomic, strong) id <FacePanelDataSource> dataSource;

- (void)updateFacePanel;
- (void)registerCellClass:(Class)cellClass;

@end

NS_ASSUME_NONNULL_END
