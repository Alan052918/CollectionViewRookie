//
//  FacePanelView.h
//  CollectionViewRookie
//
//  Created by Alan on 2020/7/27.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Face, FaceCellViewModel;
@protocol FacePanelDelegate <NSObject>

- (void)facePanelView:(UIView *)facePanelView didSelectFace:(Face *)face;
- (BOOL)addFaceDownloadProgressObserver:(NSObject *)observer;
- (BOOL)removeFaceDownloadProgressObserver:(NSObject *)observer;

@end

@interface FacePanelView : UIView

@property (nonatomic, copy) NSArray<Face *> *faceArray;
@property (nonatomic, assign) BOOL enableLoadMore;
@property (nonatomic, strong) Face *defaultFace;
@property (nonatomic, strong, nullable) Face *selectedFace;
@property (nonatomic, strong) id <FacePanelDelegate> delegate;

- (void)reloadFacePanel;

- (void)registerCellClass:(Class)cellClass;
- (void)setCellClass:(Class)cellClass;

@end

NS_ASSUME_NONNULL_END
