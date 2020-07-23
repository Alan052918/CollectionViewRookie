//
//  FacePreviewView.m
//  CollectionViewRookie
//
//  Created by Alan Ai on 2020/7/23.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "FacePreviewView.h"

@interface FacePreviewView ()

@property (nonatomic, strong) UIView *contentView;

@end

@implementation FacePreviewView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupContentView];
    }
    return self;
}

- (void)setupContentView {
    self.contentView = [[UIView alloc] initWithFrame:self.bounds];
    self.contentView.backgroundColor = [UIColor greenColor];
    UIImageView *faceMask = [[UIImageView alloc] initWithFrame:CGRectMake(90.0f, 18.0f, 195.0f, 300.0f)];
    faceMask.layer.masksToBounds = YES;
    faceMask.contentMode = UIViewContentModeScaleAspectFit;
    faceMask.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:faceMask];
    [self addSubview:self.contentView];
}

@end
