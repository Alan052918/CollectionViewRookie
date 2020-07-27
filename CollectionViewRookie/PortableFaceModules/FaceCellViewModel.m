//
//  FaceCellViewModel.m
//  CollectionViewRookie
//
//  Created by Alan Ai on 2020/7/23.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "FaceCellViewModel.h"
//#import "../FacePanelHelpers/FaceResourceManager.h"

@interface FaceCellViewModel ()

//- (void)updateFaceState:(FaceState)state;

@end

@implementation FaceCellViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.faceName = @"Face";
        self.face = nil;
        self.isSelectedFace = NO;
        self.isCelebrityFace = NO;
        self.isDownloading = NO;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name {
    self.faceName = name;
    self.face = nil;
    self.isSelectedFace = NO;
    self.isCelebrityFace = NO;
    self.isDownloading = NO;
    return self;
}

@end
