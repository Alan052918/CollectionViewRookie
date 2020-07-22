//
//  CollectionViewCell.m
//  CollectionViewRookie
//
//  Created by Alan Ai on 2020/7/22.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.textLabel = [[UILabel alloc] init];
        self.textLabel.text = @"Cell";
        self.contentView.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:self.textLabel];
    }
    return self;
}

@end
