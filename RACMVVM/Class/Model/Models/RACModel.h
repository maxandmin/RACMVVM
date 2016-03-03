//
//  RACModel.h
//  RACMVVM
//
//  Created by maxin on 16/1/28.
//  Copyright © 2016年 maxin. All rights reserved.
//

/**
 *  数据模型
 *
 *  @param copy
 *  @param nonatomic
 *
 *  @return 
 */

#import <Foundation/Foundation.h>

@interface RACModel : NSObject

@property (copy, nonatomic) NSString *articleId;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *authorname;
@property (copy, nonatomic) NSString *categoryname;


@end
