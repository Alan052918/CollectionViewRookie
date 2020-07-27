//
//  CollectionViewCell.m
//  CollectionViewRookie
//
//  Created by Alan Ai on 2020/7/22.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "FaceCell.h"
#import "FaceResourceManager.h"

@interface FaceCell ()

@property (nonatomic, strong) UILabel *faceNameLabel;
@property (nonatomic, strong) UILabel *downloadProgressLabel;
@property (nonatomic, strong) UIView *downloadProgressMask;
@property (nonatomic, strong) UIImageView *thumbImageView;

- (void)setupContentView;
- (void)updateContentViewWithViewModel:(FaceCellViewModel *)viewModel;

@end

@implementation FaceCell


- (void)dealloc {
    [FaceResourceManager.sharedInstance removeObserver:self forKeyPath:@"downloadProgressValue"];
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupContentView];
    }
    return self;
}


- (void)setFaceCellViewModel:(FaceCellViewModel *)faceCellViewModel {
    [self updateContentViewWithViewModel:faceCellViewModel];
}


- (void)setupContentView {
    self.downloadProgressLabel = [[UILabel alloc] initWithFrame:self.bounds];
    self.downloadProgressLabel.text = @"0%";
    
    self.thumbImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5.0f, 0, 50.0f, 50.0f)];
    self.thumbImageView.layer.cornerRadius = 6;
    self.thumbImageView.layer.masksToBounds = YES;
    self.thumbImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.thumbImageView.backgroundColor = [UIColor blueColor];
    [self addSubview:self.thumbImageView];
    
    self.faceNameLabel = [[UILabel alloc] init];
    self.faceNameLabel.text = @"XXX";
    self.faceNameLabel.frame = CGRectMake(0, CGRectGetMaxY(self.thumbImageView.frame), self.bounds.size.width, self.faceNameLabel.font.lineHeight);
    self.faceNameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.faceNameLabel];
}


- (void)updateContentViewWithViewModel:(FaceCellViewModel *)viewModel {
//    self.faceNameLabel.text = viewModel.faceName;
//    self.thumbImageView.image = [UIImage imageNamed:viewModel.faceName];
//    self.backgroundColor = viewModel.isSelectedFace ? [UIColor redColor] : [UIColor greenColor];
//    [self updateFaceCellState:FaceCellStateDownloading];
}


- (void)observeValueForKeyPath:(NSString *)key ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    self.downloadProgressLabel.text = [[object valueForKey:@"downloadProgressValue"] stringValue];
    NSLog(@"observer download progress: %@", self.downloadProgressLabel.text);
}


@end
