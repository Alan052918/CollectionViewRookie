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

// Customized face panel helpers
#import "FaceCell.h"
#import "FaceResourceManager.h"
#import "FaceDownloadRequest.h"

@interface ViewController () <FacePanelDelegate>

//@property (nonatomic, strong) NSMutableDictionary <FaceCellViewModel *, FaceDownloadRequest *> *faceDownloadRequestMap;
@property (nonatomic, strong) FacePanelView *facePanelView;
@property (nonatomic, strong) FacePanelViewModel *facePanelViewModel;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.facePanelViewModel = [[FacePanelViewModel alloc] init];
    
    
    self.facePanelView = [[FacePanelView alloc] initWithFrame:self.view.bounds];
    self.facePanelView.delegate = self;
    [self.facePanelView registerCellClass:[FaceCell class]];
    [self.facePanelView setCellClass:[FaceCell class]];
    [self.facePanelView updateFacePanel];
    [self.view addSubview:self.facePanelView];
    
    self.navigationItem.title = @"Navigation Bar";
    self.navigationController.toolbarHidden = NO;
}


#pragma mark - FacePanelDelegate

- (void)facePanelView:(nonnull UIView *)facePanelView didSelectFace:(nonnull Face *)face {
    if ([FaceResourceManager.sharedInstance downloadFace]) {
        NSLog(@"Download complete");
    }
}


- (void)facePanelView:(nonnull FacePanelView *)facePanelView updateWithViewModel:(nonnull NSObject *)viewModel {
    <#code#>
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


@end
