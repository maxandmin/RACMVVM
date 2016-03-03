//
//  CellViewModel.m
//  RACMVVM
//
//  Created by maxin on 16/1/28.
//  Copyright © 2016年 maxin. All rights reserved.
//

#import "CellViewModel.h"

@implementation CellViewModel

- (instancetype)initWithModel:(RACModel *)articleModel{

    self = [super init];
    
    if (self) {
        self.articleModel = articleModel;
        [self setupData];
    }
    
    return self;
}

// 处理Model中的数据
- (void)setupData {
    
    _titleText = self.articleModel.title;
}

@end
