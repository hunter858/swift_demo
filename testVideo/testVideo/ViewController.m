//
//  ViewController.m
//  testVideo
//
//  Created by edz on 2019/8/16.
//  Copyright © 2019 edz. All rights reserved.
//

#import "ViewController.h"
#import "WMPlayer.h"
#import "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WMPlayerModel *playerModel = [WMPlayerModel new];
//    playerModel.title = @"33333";
    playerModel.videoURL = [NSURL URLWithString:@"http://video-oss.qiaofangyun.com/32221635-C638-4A8E-8F26-8E7C6B58EAEB/propertyVideo/2019/8/2/GNPLWsdStexCpZPJTg7QpjcPLwUUWczU."];
    WMPlayer * wmPlayer = [[WMPlayer alloc]initPlayerModel:playerModel];
    [self.view addSubview:wmPlayer];
    [wmPlayer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.top.equalTo(self.view);
        make.height.mas_equalTo(wmPlayer.mas_width).multipliedBy(9.0/16);
    }];
    [wmPlayer play];
    
    
//    UIWebView *webView =[[UIWebView alloc]init];
//    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
//    [self.view addSubview:webView];
//    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(self.view);
//        make.bottom.equalTo(self.view);
//        make.height.equalTo(@200);
//    }];
    
    // Do any additional setup after loading the view.
}


@end
