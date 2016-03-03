//
//  RACCell.h
//  RACMVVM
//
//  Created by maxin on 16/1/28.
//  Copyright © 2016年 maxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellViewModel.h"
@interface RACCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *Clabel;

// cell的VM
@property (strong, nonatomic) CellViewModel *viewModel;
@end
