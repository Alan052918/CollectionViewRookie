//
//  FacePanelCellViewModel.h
//  CollectionViewRookie
//
//  Created by Alan on 2020/7/27.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FaceCellViewModel : NSObject

@property (nonatomic, strong) NSString *faceImageName;
@property (nonatomic, assign) BOOL *isSelectedFace;

- (instancetype)initWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
