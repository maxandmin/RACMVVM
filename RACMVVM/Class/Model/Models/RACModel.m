//
//  RACModel.m
//  RACMVVM
//
//  Created by maxin on 16/1/28.
//  Copyright © 2016年 maxin. All rights reserved.
//

#import "RACModel.h"

@implementation RACModel

// MJExtension中替换属性名称的方法
+ (NSDictionary *)replacedKeyFromPropertyName {
    
    return @{@"articleId" : @"id"};
}

@end
