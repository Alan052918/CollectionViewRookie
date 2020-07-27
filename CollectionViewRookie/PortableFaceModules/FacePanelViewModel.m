//
//  FacePanelViewModel.m
//  CollectionViewRookie
//
//  Created by Alan on 2020/7/27.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "FacePanelViewModel.h"
#import "FaceCellViewModel.h"

@interface FacePanelViewModel ()

@property (nonatomic, strong) NSMutableArray <FaceCellViewModel *> *cellViewModelList;

@property (nonatomic, strong) NSArray <NSString *> *placeholderImageNameList;

@end

@implementation FacePanelViewModel


- (instancetype)init {
    self = [super init];
    if (self) {
        self.cellViewModelList = [[NSMutableArray alloc] init];
        self.placeholderImageNameList = [[NSArray alloc] initWithObjects:@"Alice", @"Bob", @"Jack", @"John", nil];
        for (int i = 0; i < self.placeholderImageNameList.count; ++i) {
            FaceCellViewModel *faceCellViewModel = [[FaceCellViewModel alloc] initWithName:[self.placeholderImageNameList objectAtIndex:i]];
            [self.cellViewModelList addObject:faceCellViewModel];
        }
    }
    return self;
}


- (NSInteger)countViewModels {
    return self.cellViewModelList.count;
}


- (FaceCellViewModel *)cellViewModelForItemAtIndex:(NSInteger)index {
    return [self.cellViewModelList objectAtIndex:index];
}


@end
