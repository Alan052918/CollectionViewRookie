//
//  FacePanelViewController.h
//  CollectionViewRookie
//
//  Created by Alan Ai on 2020/7/27.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Face, FaceCellViewModel;
@protocol FacePanelDelegate <NSObject>

- (void)facePanel:(UIViewController *)panel didSelectFace:(Face *)face;
- (void)addFaceDownloadProgressObserver:(NSObject *)observer;

@end

@interface FacePanelViewController : UIViewController

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
