//
//  ViewController.m
//  RACMVVM
//
//  Created by maxin on 16/1/26.
//  Copyright © 2016年 maxin. All rights reserved.
//

#import "ViewController.h"
#import "RACTableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)GORAC:(id)sender {
    
    RACTableViewController *RACTable = [[RACTableViewController alloc]init];
    [self.navigationController pushViewController:RACTable animated:YES];
}


@end
