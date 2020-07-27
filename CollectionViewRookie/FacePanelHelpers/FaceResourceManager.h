//
//  FaceResourceManager.h
//  CollectionViewRookie
//
//  Created by Alan Ai on 2020/7/24.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FaceResourceManager : NSObject

@property (nonatomic, assign) NSUInteger downloadProgressValue;

+ (instancetype)sharedInstance;
- (BOOL)downloadFace;

@end

NS_ASSUME_NONNULL_END
