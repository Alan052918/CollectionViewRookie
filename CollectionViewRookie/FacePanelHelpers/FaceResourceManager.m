//
//  FaceResourceManager.m
//  CollectionViewRookie
//
//  Created by Alan Ai on 2020/7/24.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "FaceResourceManager.h"

@interface FaceResourceManager ()

@end

@implementation FaceResourceManager

+ (instancetype)sharedInstance {
    static FaceResourceManager *sharedFaceResourceManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedFaceResourceManager = [[FaceResourceManager alloc] init];
    });
    return sharedFaceResourceManager;
}

- (BOOL)downloadFace {
    for (int i = 0; i <= 10; ++i) {
        [self setValue:[NSNumber numberWithInteger:i] forKeyPath:@"downloadProgressValue"];
        [NSThread sleepForTimeInterval:0.1f];
        NSLog(@"manager download progress: %lu", self.downloadProgressValue);
    }
    return YES;
}

@end
