//
//  FacePanelView.m
//  CollectionViewRookie
//
//  Created by Alan on 2020/7/27.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "FacePanelView.h"
#import "FaceCell.h"

typedef NS_ENUM(NSUInteger, FaceState) {
    FaceStateDefault,
    FaceStateDownloading,
};

@interface FacePanelView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *contentCollectionView;

- (void)updateFaceState:(FaceState)state;

@end

@implementation FacePanelView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(60.0f, 70.5f);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.minimumInteritemSpacing = 11.0f;
        flowLayout.minimumLineSpacing = 20.0f;
        flowLayout.sectionInset = UIEdgeInsetsMake(20.0f, 15, 20.0f, 15);

        self.contentCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        self.contentCollectionView.delegate = self;
        self.contentCollectionView.dataSource = self;
        self.contentCollectionView.backgroundColor = [UIColor clearColor];
        
        // default cell class is FaceCell, can be changed with registerClass: and setCellClass:
        self.cellClass = [FaceCell class];
        [self.contentCollectionView registerClass:self.cellClass forCellWithReuseIdentifier:NSStringFromClass(self.cellClass)];
        
        [self addSubview:self.contentCollectionView];
    }
    return self;
}


#pragma mark - Collection View Delegate

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    /// @note Customized cell class for now must inherit from FaceCell class
    UICollectionViewCell *collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(self.cellClass) forIndexPath:indexPath];
    [self.dataSource updateViewModelForCell:(FaceCell *)collectionViewCell atIndexPath:indexPath];
    return collectionViewCell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cell %@ selected!", indexPath);
    [self updateFaceState:FaceStateDownloading];
    [self.delegate facePanelView:self didSelectFaceCellAtIndexPath:indexPath];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataSource countFaces];
}


#pragma mark - Modularity

- (void)updateFacePanel {
    [self.contentCollectionView reloadData];
}


- (void)registerCellClass:(Class)cellClass{
    [self.contentCollectionView registerClass:cellClass forCellWithReuseIdentifier:NSStringFromClass([cellClass class])];
}


- (void)updateFaceState:(FaceState)state {
    switch (state) {
        case FaceStateDefault:
            break;
        case FaceStateDownloading:
            [self.delegate addFaceDownloadProgressObserver:self];
            break;
        default:
            break;
    }
}


@end
