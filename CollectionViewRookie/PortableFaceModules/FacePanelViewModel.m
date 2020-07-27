//
//  FacePanelViewModel.m
//  CollectionViewRookie
//
//  Created by Alan on 2020/7/27.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "FacePanelViewModel.h"
#import "FacePanelCellViewModel.h"

@interface FacePanelViewModel ()

@property (nonatomic, strong) NSMutableArray <FacePanelCellViewModel *> *cellViewModelList;

@property (nonatomic, strong) NSArray <NSString *> *placeholderImageNameList;
@property (nonatomic, strong) NSArray <NSString *> *placeholderTextList;

@end

@implementation FacePanelViewModel


- (instancetype)init {
    self = [super init];
    if (self) {
        self.cellViewModelList = [[NSMutableArray alloc] init];
        self.placeholderImageNameList = [[NSArray alloc] initWithObjects:@"Alice", @"Bob", @"Jack", @"John", nil];
        self.placeholderTextList = [[NSArray alloc] initWithObjects:@"Alice", @"Bob", @"Jack", @"John", nil];
    }
    return self;
}


@end
