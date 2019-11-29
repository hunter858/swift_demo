//
//  RNViewController.m
//  hybirdDemo
//
//  Created by edz on 2019/11/21.
//  Copyright © 2019 edz. All rights reserved.
//

#import "RNViewController.h"
#import <React/RCTRootView.h>
@interface RNViewController ()

@end

@implementation RNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.navigationController setNavigationBarHidden:YES];
    
//    NSString *pathString = [[NSBundle mainBundle]pathForResource:@"index.jsbundle" ofType:nil] ;
    NSString *pathString = @"http://192.168.161.21:8081/index.bundle?platform=ios&dev=true";
    
// NSURL *pathURL = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
    NSURL *pathURL = [NSURL URLWithString:pathString];
    NSDictionary *params =@{@"key1":@"123",
                            @"key2":@"321",};
    RCTRootView *rootView = [[RCTRootView alloc]initWithBundleURL:pathURL moduleName:@"testDemo" initialProperties:params launchOptions:nil];
    rootView.frame = self.view.bounds;
    [self.view addSubview:rootView];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(NavigationPopAction) name:@"NavigateBackNotifcation" object:nil];

}

-(void)NavigationPopAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;

}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"NavigateBackNotifcation" object:nil];
}
    

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
