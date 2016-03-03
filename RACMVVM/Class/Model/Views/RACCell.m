//
//  RACCell.m
//  RACMVVM
//
//  Created by maxin on 16/1/28.
//  Copyright © 2016年 maxin. All rights reserved.
//

#import "RACCell.h"

@implementation RACCell

- (void)awakeFromNib {
    // Initialization code
    [self setupSignal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// 设置信号量，当cell的vm被重新赋值时，更新cell显示的数据
- (void)setupSignal {
    
    @weakify(self);
    [RACObserve(self, viewModel) subscribeNext:^(CellViewModel *viewModel) {
        
        // 使用strong修饰self，防止在self在使用中被释放
        @strongify(self);
        // vm已经将要显示的文本处理好了，在cell中直接赋值就行
        self.Clabel.text = viewModel.titleText;

    }];
}

@end
