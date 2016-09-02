//
//  SkinCollectionViewCell.m
//  Skin
//
//  Created by Lester on 16/9/2.
//  Copyright © 2016年 Lester-iOS开发:98787555. All rights reserved.
//

#import "SkinCollectionViewCell.h"

@implementation SkinCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

#pragma mark - 懒加载
- (UIImageView *)imageView{
    if(!_imageView){
        _imageView = [[UIImageView alloc]initWithFrame:self.bounds];
    }
    return _imageView;
}

@end
