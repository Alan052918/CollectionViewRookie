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

@class Face;
@interface FaceCellViewModel : NSObject

@property (nonatomic, strong) NSString *faceName;
@property (nonatomic, assign) BOOL isDefaultFace;
@property (nonatomic, assign) BOOL isSelectedFace;
@property (nonatomic, strong, nullable) Face *face;

@end

NS_ASSUME_NONNULL_END
