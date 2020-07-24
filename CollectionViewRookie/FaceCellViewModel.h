//
//  FaceCellViewModel.h
//  CollectionViewRookie
//
//  Metadata of a Face cell
//
//  Created by Alan Ai on 2020/7/23.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FaceCellViewModelDelegate <NSObject>

- (void)addDownloadProgressObserver:(NSObject *)observer;

@end

@class Face;
@interface FaceCellViewModel : NSObject

@property (nonatomic, strong) NSString *faceName;
@property (nonatomic, strong, nullable) Face *face;
@property (nonatomic, assign) NSUInteger uid;
@property (nonatomic, assign) BOOL isSelectedFace;
@property (nonatomic, assign) BOOL isCelebrityFace;
@property (nonatomic, assign) BOOL isDownloading;

- (instancetype)initWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
