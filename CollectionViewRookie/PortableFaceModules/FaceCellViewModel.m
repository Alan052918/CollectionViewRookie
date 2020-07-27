//
//  FacePanelCellViewModel.m
//  CollectionViewRookie
//
//  Created by Alan on 2020/7/27.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "FaceCellViewModel.h"

@implementation FaceCellViewModel

- (instancetype)init {
    self = [super init];
    return self;
}

- (instancetype)initWithName:(NSString *)name {
    self = [self init];
    self.faceImageName = name;
    return self;
}

@end
