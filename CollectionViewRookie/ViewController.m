//
//  ViewController.m
//  CollectionViewRookie
//
//  Created by Alan Ai on 2020/7/22.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "ViewController.h"
#import "FacePanelView.h"
#import "FacePreviewView.h"
#import "FacePanelHelpers/FaceResourceManager.h"
#import "FacePanelHelpers/FaceDownloadRequest.h"

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

    FacePanelView *facePanelView = [[FacePanelView alloc] initWithFrame:CGRectMake(0, 440, self.view.frame.size.width, 183)];
    facePanelView.delegate = self;
    [self.view addSubview:facePanelView];
    
    self.navigationItem.title = @"Navigation Bar";
    self.navigationController.toolbarHidden = NO;
}

- (void)facePanelView:(UIView *)panelView didSelectFace:(Face *)face {
    [FaceResourceManager.sharedInstance downloadFace];
}

- (void)addFaceDownloadObserver:(nonnull NSObject *)observer {
    [FaceResourceManager.sharedInstance addObserver:observer forKeyPath:@"downloadProgressValue" options:NSKeyValueObservingOptionNew context:nil];
}

@end
