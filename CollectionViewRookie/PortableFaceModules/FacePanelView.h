//
//  FacePanel.h
//  CollectionViewRookie
//
//  A subview that displays a face mesh
//
//  Created by Alan Ai on 2020/7/22.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Face, FaceCellViewModel;
@protocol FacePanelDelegate <NSObject>

- (void)facePanelView:(UIView *)panelView didSelectFace:(Face *)face;
- (void)addFaceDownloadObserver:(NSObject *)observer;

@end

@interface FacePanelView : UIView

@property (nonatomic, copy) NSArray<Face *> *faceArray;
@property (nonatomic, assign) BOOL enableLoadMore;
@property (nonatomic, strong) Face *defaultFace;
@property (nonatomic, strong, nullable) Face *selectedFace;
@property (nonatomic, strong) id <FacePanelDelegate> delegate;

/**
 * Register custom cell at collection view
 *
 * @param cellClass cell class to register
 * @param identifier reuse identifier
 */
- (void)registerClass:(Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier;

@end

NS_ASSUME_NONNULL_END
