//
//  Face.h
//  CollectionViewRookie
//
//  Created by Alan Ai on 2020/7/22.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Face : NSObject

@property (nonatomic, assign) NSUInteger faceId;
@property (nonatomic, strong) NSString *faceImageName;

@property (nonatomic, copy) NSString *faceCoverUrl;
@property (nonatomic, assign) unsigned int timestamp;

@end

NS_ASSUME_NONNULL_END
