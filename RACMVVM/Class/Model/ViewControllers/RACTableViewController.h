//
//  RACTableViewController.h
//  RACMVVM
//
//  Created by maxin on 16/1/28.
//  Copyright © 2016年 maxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RACViewModel.h"
@interface RACTableViewController : UITableViewController

// vm
@property (strong, nonatomic) RACViewModel *viewModel;

@end
