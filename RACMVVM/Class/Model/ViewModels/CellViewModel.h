//
//  CellViewModel.h
//  RACMVVM
//
//  Created by maxin on 16/1/28.
//  Copyright © 2016年 maxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RACModel.h"

@interface CellViewModel : NSObject

@property (strong, nonatomic) RACModel *articleModel;

@property (copy, nonatomic, readonly) NSString *titleText;

- (instancetype)initWithModel:(RACModel *)articleModel;

@end
