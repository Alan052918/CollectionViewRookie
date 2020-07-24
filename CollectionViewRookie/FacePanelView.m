//
//  FacePanel.m
//  CollectionViewRookie
//
//  Created by Alan Ai on 2020/7/22.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "FacePanelView.h"
#import "FaceCell.h"
#import "FaceCellViewModel.h"
#import "Face.h"

@interface FacePanelView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *contentCollectionView;
@property (nonatomic, copy) NSMutableArray<FaceCellViewModel *> *dataSource;


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
    self.dataSource = [[NSMutableArray alloc] initWithObjects:FCVM0, FCVM1, FCVM2, FCVM3, FCVM4, FCVM5, FCVM6, FCVM7, FCVM8, nil];
    self.dataSource.firstObject.isSelectedFace = YES;
}

#pragma mark - Collection View Setup

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
    [self.contentCollectionView registerClass:[FaceCell class] forCellWithReuseIdentifier:NSStringFromClass([FaceCell class])];
    [self addSubview:self.contentCollectionView];
}

#pragma mark - Collection View Delegate

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    FaceCell *collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([FaceCell class]) forIndexPath:indexPath];
    collectionViewCell.backgroundColor = collectionViewCell.faceCellViewModel.isSelectedFace ? [UIColor orangeColor] : [UIColor greenColor];
    collectionViewCell.faceCellViewModel = [self.dataSource objectAtIndex:indexPath.item];
    return collectionViewCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cell %@ selected!", indexPath);
    [self.dataSource objectAtIndex:indexPath.item].isSelectedFace = YES;
    [self.dataSource objectAtIndex:indexPath.item].isDownloading = YES;
    [collectionView reloadData];
    [self.delegate facePanelView:self didSelectFace:[self.dataSource objectAtIndex:indexPath.item].face];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

#pragma mark - Modularity

- (void)registerClass:(Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier {
    [self.contentCollectionView registerClass:cellClass forCellWithReuseIdentifier:identifier];
}

@end
