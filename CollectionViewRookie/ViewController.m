//
//  ViewController.m
//  CollectionViewRookie
//
//  Created by Alan Ai on 2020/7/22.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "ViewController.h"
#import "FacePreviewView.h"

// Wire in face panel view
#import "FacePanelView.h"
#import "FacePanelViewModel.h"
#import "FaceCell.h"
#import "FaceCellViewModel.h"

// Customized face panel helpers
#import "FaceResourceManager.h"
#import "FaceDownloadRequest.h"

@interface ViewController () <FacePanelDelegate, FacePanelDataSource>

@property (nonatomic, strong) FacePanelView *facePanelView;
@property (nonatomic, strong) FacePanelViewModel *facePanelViewModel;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.facePanelViewModel = [[FacePanelViewModel alloc] init];
    
    self.facePanelView = [[FacePanelView alloc] initWithFrame:self.view.bounds];
    self.facePanelView.delegate = self;
    self.facePanelView.dataSource = self;
    [self.facePanelView registerCellClass:[FaceCell class]];
    [self.facePanelView setCellClass:[FaceCell class]];
    [self.facePanelView updateFacePanel];
    [self.view addSubview:self.facePanelView];
    
    self.navigationItem.title = @"Navigation Bar";
    self.navigationController.toolbarHidden = NO;
}


#pragma mark - FacePanelDelegate

- (void)facePanelView:(nonnull FacePanelView *)facePanelView didSelectFaceCellAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSLog(@"[%@].m facePanel didSelectFaceCell", [self class]);
}


/// optional
- (BOOL)addFaceDownloadProgressObserver:(nonnull NSObject *)observer {
    [FaceResourceManager.sharedInstance addObserver:observer forKeyPath:@"downloadProgressValue" options:NSKeyValueObservingOptionNew context:nil];
    return YES;
}


/// optional
- (BOOL)removeFaceDownloadProgressObserver:(nonnull NSObject *)observer {
    [FaceResourceManager.sharedInstance removeObserver:observer forKeyPath:@"downloadProgressValue"];
    return YES;
}


#pragma mark - FacePanelDataSource

- (NSInteger)countFaces {
    return [self.facePanelViewModel countViewModels];
}


- (void)updateViewModelForCell:(FaceCell *)cell atIndexPath:(nonnull NSIndexPath *)indexPath {
    cell.faceNameLabel.text = [self.facePanelViewModel cellViewModelForItemAtIndex:indexPath.item].faceImageName;
    cell.thumbImageView.image = [UIImage imageNamed:cell.faceNameLabel.text];
}


@end
