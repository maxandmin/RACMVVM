//
//  RACViewModel.m
//  RACMVVM
//
//  Created by maxin on 16/1/28.
//  Copyright © 2016年 maxin. All rights reserved.
//

#import "RACViewModel.h"
#import "RACModel.h"
#import "CellViewModel.h"


@implementation RACViewModel


-(RACSignal *)requestSignal{

    
    if (!_requestSignal) {
        
         @weakify(self);
        
        _requestSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber){
        
              @strongify(self);
        
            // 配置网络请求参数
            NSDictionary *parameters = @{@"page": @(self.currentPage)};

            NSURLSessionDataTask *task = [self.sessionManager POST:@"http://www.brighttj.com/api/index.php/api/article/articleList" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject){
                
                // 将请求下来的字典->模型
                NSArray *articleArray = responseObject[@"data"][@"articleList"];
                
                if (self.iSRefresh) {
                    [self.articleViewModels removeAllObjects];
                }
                
                for (NSDictionary *articleDictionary in articleArray) {
                    RACModel *articleModel = [RACModel mj_objectWithKeyValues:articleDictionary];
                    // 根据模型，初始化cell的vm
                    CellViewModel *cellmodel = [[CellViewModel alloc] initWithModel:articleModel];
                    // 将cell的vm存入数组
                    [self.articleViewModels addObject:cellmodel];
                }
                // 完成数据处理后，赋值给dataSource
                self.dataSource = [self.articleViewModels copy];
                [subscriber sendNext:self.dataSource];
                [subscriber sendCompleted];
                
            } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                
                [subscriber sendError:error];
            }];
            
            // 在信号量作废时，取消网络请求
            return [RACDisposable disposableWithBlock:^{
                
                [task cancel];
            }];
            
        }];
        
    }
     return _requestSignal;

}
- (NSMutableArray *)articleViewModels {
    
    if (!_articleViewModels) {
        _articleViewModels = [NSMutableArray new];
    }
    return _articleViewModels;
}

@end
