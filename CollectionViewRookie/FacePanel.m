//
//  FacePanel.m
//  CollectionViewRookie
//
//  Created by Alan Ai on 2020/7/22.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "Face/FacePanelView.h"
#import "FaceCell.h"
#import "Face/FaceCellViewModel.h"
#import "Face/Face.h"

@interface FacePanelView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *contentCollectionView;
@property (nonatomic, copy) NSArray<FaceCellViewModel *> *dataSource;

@end

@implementation FacePanelView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupContentView];
        self.selectedFace = nil;
        self.enableLoadMore = YES;
    }
    return self;
}

- (void)setupContentView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(60.0f, 70.5f);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumInteritemSpacing = 11.0f;
    flowLayout.minimumLineSpacing = 20.0f;
    flowLayout.sectionInset = UIEdgeInsetsMake(20.0f, 15, 20.0f, 15);

    self.contentCollectionView = [[UICollectionView alloc] initWithFrame:[[UIScreen mainScreen] bounds] collectionViewLayout:flowLayout];
    self.contentCollectionView.delegate = self;
    self.contentCollectionView.dataSource = self;
    self.contentCollectionView.backgroundColor = [UIColor clearColor];
    [self.contentCollectionView registerClass:[FaceCell class] forCellWithReuseIdentifier:NSStringFromClass([FaceCell class])];
    [self addSubview:self.contentCollectionView];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    FaceCell *collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([FaceCell class]) forIndexPath:indexPath];
    collectionViewCell.backgroundColor = [UIColor greenColor];
    return collectionViewCell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 42;
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    return self.contentCollectionView.frame.size;
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    return YES;
}

- (void)updateFocusIfNeeded {
    NSLog(@"Update focus if needed");
}

@end
