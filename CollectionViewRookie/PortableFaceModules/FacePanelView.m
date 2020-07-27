//
//  FacePanelView.m
//  CollectionViewRookie
//
//  Created by Alan on 2020/7/27.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "FacePanelView.h"
#import "FaceCell.h"
#import "FaceCellViewModel.h"
#import "Face.h"

typedef NS_ENUM(NSUInteger, FaceState) {
    FaceStateDefault,
    FaceStateDownloading,
};

@interface FacePanelView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *contentCollectionView;
@property (nonatomic, copy) NSMutableArray<FaceCellViewModel *> *dataSource;
@property (nonatomic, strong) Class cellClass;

@end

@implementation FacePanelView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupDataSource];
        [self setupContentView];
        self.selectedFace = nil;
        self.enableLoadMore = YES;
    }
    return self;
}

#pragma mark - Collection View Setup

- (void)setupDataSource {
    FaceCellViewModel *FCVM0 = [[FaceCellViewModel alloc] initWithName:@"Alice"];
    FaceCellViewModel *FCVM1 = [[FaceCellViewModel alloc] initWithName:@"Bob"];
    FaceCellViewModel *FCVM2 = [[FaceCellViewModel alloc] initWithName:@"John"];
    FaceCellViewModel *FCVM3 = [[FaceCellViewModel alloc] initWithName:@"Jack"];
    FaceCellViewModel *FCVM4 = [[FaceCellViewModel alloc] init];
    FaceCellViewModel *FCVM5 = [[FaceCellViewModel alloc] init];
    FaceCellViewModel *FCVM6 = [[FaceCellViewModel alloc] init];
    FaceCellViewModel *FCVM7 = [[FaceCellViewModel alloc] init];
    FaceCellViewModel *FCVM8 = [[FaceCellViewModel alloc] init];
    FaceCellViewModel *FCVM9 = [[FaceCellViewModel alloc] init];
    FaceCellViewModel *FCVM10 = [[FaceCellViewModel alloc] init];
    FaceCellViewModel *FCVM11 = [[FaceCellViewModel alloc] init];
    FaceCellViewModel *FCVM12 = [[FaceCellViewModel alloc] init];
    self.dataSource = [[NSMutableArray alloc] initWithObjects:FCVM0, FCVM1, FCVM2, FCVM3, FCVM4, FCVM5, FCVM6, FCVM7, FCVM8, FCVM9, FCVM10, FCVM11, FCVM12, nil];
    self.dataSource.firstObject.isSelectedFace = YES;
}

- (void)setupContentView {
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
    [self.contentCollectionView registerClass:[FaceCell class] forCellWithReuseIdentifier:NSStringFromClass([FaceCell class])];
    self.cellClass = [FaceCell class];
    [self addSubview:self.contentCollectionView];
}

#pragma mark - Collection View Delegate

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    FaceCell *collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(self.cellClass) forIndexPath:indexPath];
    collectionViewCell.backgroundColor = collectionViewCell.faceCellViewModel.isSelectedFace ? [UIColor orangeColor] : [UIColor greenColor];
    collectionViewCell.faceCellViewModel = [self.dataSource objectAtIndex:indexPath.item];
    return collectionViewCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cell %@ selected!", indexPath);
    [self.dataSource objectAtIndex:indexPath.item].isSelectedFace = YES;
    self.selectedFace = [self.dataSource objectAtIndex:indexPath.item].face;
    [self.dataSource objectAtIndex:indexPath.item].isDownloading = YES;
    [collectionView reloadData];
    [self.delegate facePanelView:self didSelectFace:[self.dataSource objectAtIndex:indexPath.item].face];
    [self updateFaceState:FaceStateDownloading];
//    [self.delegate facePanelView:self didSelectFace:[self.dataSource objectAtIndex:indexPath.item].face];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

#pragma mark - Modularity

- (void)reloadFacePanel {
    [self.contentCollectionView reloadData];
}

- (void)registerCellClass:(Class)cellClass{
    [self.contentCollectionView registerClass:cellClass forCellWithReuseIdentifier:NSStringFromClass([cellClass class])];
}

- (void)setCellClass:(Class)cellClass{
    _cellClass = cellClass;
}

- (void)updateFaceState:(FaceState)state {
    switch (state) {
        case FaceStateDefault:
            break;
        case FaceStateDownloading:
            if ([self.delegate addFaceDownloadProgressObserver:self]) {
                [self.delegate removeFaceDownloadProgressObserver:self];
            }
            break;
        default:
            break;
    }
}

@end
