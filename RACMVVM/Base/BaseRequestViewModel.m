//
//  BaseRequestViewModel.m
//  RACMVVM
//
//  Created by maxin on 16/1/28.
//  Copyright © 2016年 maxin. All rights reserved.
//

#import "BaseRequestViewModel.h"

@implementation BaseRequestViewModel


-(AFHTTPSessionManager *)sessionManager{

    if (!_sessionManager) {
        _sessionManager = [AFHTTPSessionManager manager];

    }
    return _sessionManager;
}

// 在对象销毁时，别忘了取消已经在队列中的请求
- (void)dealloc {
    
    [self.sessionManager invalidateSessionCancelingTasks:YES];
}

@end
