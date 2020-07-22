//
//  ViewController.m
//  CollectionViewRookie
//
//  Created by Alan Ai on 2020/7/22.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSString *cellReuseIdentifier;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.cellReuseIdentifier = @"collectionCellIdentifier";
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:self.cellReuseIdentifier];
    [self.view addSubview:self.collectionView];
    self.navigationItem.title = @"Navigation Bar";
//    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.toolbarHidden = NO;
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithTitle:@"Tool Bar" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationController.toolbar setItems:@[barItem] animated:YES];
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CollectionViewCell *collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellReuseIdentifier forIndexPath:indexPath];
    collectionViewCell.backgroundColor = [UIColor greenColor];
    return collectionViewCell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return CGSizeMake(100, 80);
//}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 42;
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    return self.collectionView.frame.size;
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    return YES;
}

- (void)updateFocusIfNeeded {
    NSLog(@"Update focus if needed");
}

- (UICollectionView *)collectionView {
    if (_collectionView) {
        return _collectionView;
    }
//    UICollectionViewLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(60.0f, 70.5f);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumInteritemSpacing = 11.0f;
    flowLayout.minimumLineSpacing = 20.0f;
    flowLayout.sectionInset = UIEdgeInsetsMake(20.0f, 15, 20.0f, 15);

    _collectionView = [[UICollectionView alloc] initWithFrame:[[UIScreen mainScreen] bounds] collectionViewLayout:flowLayout];
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    return _collectionView;
}

@end
