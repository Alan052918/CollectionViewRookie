//
//  FaceCellViewModel.m
//  CollectionViewRookie
//
//  Created by Alan Ai on 2020/7/23.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "FaceCellViewModel.h"

@implementation FaceCellViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.faceName = @"Face";
        self.face = nil;
        self.defaultFace = NO;
        self.selectedFace = NO;
    }
    return self;
}

@end
