//
//  CollectionViewCell.m
//  CollectionViewRookie
//
//  Created by Alan Ai on 2020/7/22.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "FaceCell.h"
#import "FaceCellViewModel.h"

@interface FaceCell ()

@property (nonatomic, strong) UILabel *faceNameLabel;
@property (nonatomic, strong) UILabel *downloadProgressLabel;
@property (nonatomic, strong) UIImageView *thumbImageView;

@end

@implementation FaceCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupContentView];
    }
    return self;
}

- (void)setupContentView {
    self.downloadProgressLabel = [[UILabel alloc] initWithFrame:self.bounds];
    self.downloadProgressLabel.text = @"0%";
    
    self.thumbImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5.0f, 0, 50.0f, 50.0f)];
    self.thumbImageView.layer.cornerRadius = 6;
    self.thumbImageView.layer.masksToBounds = YES;
    self.thumbImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.thumbImageView.backgroundColor = [UIColor blueColor];
    [self addSubview:self.thumbImageView];
    
    self.faceNameLabel = [[UILabel alloc] init];
    self.faceNameLabel.text = @"Face";
    self.faceNameLabel.frame = CGRectMake(0, CGRectGetMaxY(self.thumbImageView.frame), self.bounds.size.width, self.faceNameLabel.font.lineHeight);
    self.faceNameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.faceNameLabel];
}

@end
