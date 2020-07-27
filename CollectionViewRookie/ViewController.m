//
//  ViewController.m
//  CollectionViewRookie
//
//  Created by Alan Ai on 2020/7/22.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "ViewController.h"
#import "FacePanelViewController.h"
#import "FacePreviewView.h"
#import "FaceCell.h"
#import "FaceResourceManager.h"
#import "FaceDownloadRequest.h"

@interface ViewController () <FacePanelDelegate>

@property (nonatomic, strong) NSMutableDictionary<FaceCellViewModel *, FaceDownloadRequest *> *faceDownloadRequestMap;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    FacePreviewView *facePreviewView = [[FacePreviewView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 336)];
    [self.view addSubview:facePreviewView];
    
    UILabel *placeholderView = [[UILabel alloc] initWithFrame:CGRectMake(0, 400, self.view.frame.size.width, 40)];
    placeholderView.text = @"Video Playback Segment Control View";
    placeholderView.textAlignment = NSTextAlignmentCenter;
    placeholderView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:placeholderView];

    FacePanelViewController *facePanelViewController = [[FacePanelViewController alloc] init];
    facePanelViewController.view.frame = CGRectMake(0, 440, self.view.frame.size.width, 183);
    facePanelViewController.delegate = self;
    [facePanelViewController registerCellClass:[FaceCell class]];
    [facePanelViewController setCellClass:[FaceCell class]];
    [self addChildViewController:facePanelViewController];
    [self.view addSubview:facePanelViewController.view];
}

- (void)addFaceDownloadProgressObserver:(nonnull NSObject *)observer {
    [FaceResourceManager.sharedInstance addObserver:observer forKeyPath:@"downloadProgressValue" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)facePanel:(nonnull UIViewController *)panel didSelectFace:(nonnull Face *)face {
    [FaceResourceManager.sharedInstance downloadFace];
}

@end
