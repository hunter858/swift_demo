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




- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor orangeColor]];
    UIButton *button  = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 150, 40)];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitle:@"jump to RactNativeContol" forState:UIControlStateNormal];
    [self.view addSubview:button];
    button.center = self.view.center;
    [button addTarget:self action:@selector(buttonAciton:) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view.
}

-(void)buttonAciton:(UIButton *)button{
    RNViewController *control =[[RNViewController alloc]init];
    [self.navigationController pushViewController:control animated:YES];
}

@end
