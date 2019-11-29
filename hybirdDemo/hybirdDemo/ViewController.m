//
//  ViewController.m
//  hybirdDemo
//
//  Created by edz on 2019/11/21.
//  Copyright © 2019 edz. All rights reserved.
//

#import "ViewController.h"
#import "RNViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)ButtonClickAction:(id)sender {
    RNViewController *RNControl =[RNViewController new];
    [self.navigationController pushViewController:RNControl animated:nil];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}


@end
