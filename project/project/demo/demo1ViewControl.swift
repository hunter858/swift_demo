//
//  demo1ViewControl.swift
//  project
//
//  Created by edz on 2019/8/12.
//  Copyright © 2019 edz. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import WebKit
import SnapKit

class demo1ViewControl: UIViewController {
    
    
    lazy var imageOne =  UIImageView()
    lazy var imageTwo =  UIImageView()
    lazy var imageThree =  UIImageView()
    
    
    override func viewDidLoad() {
        self.title = "demo1"
        self.view.backgroundColor = UIColor.white;
       
        /* 简单布局*/
        setUpSubViews();
        
        /* 初始化webview*/
        setUpWebView();
    
        
        
    
        
    }
    
    func setUpSubViews() -> () {
        
    
        let imageView1 = UIImageView();
        let imageView2 = UIImageView();
        let imageView3 = UIImageView();
        
        self.imageOne = imageView1;
        self.imageTwo = imageView2;
        self.imageThree = imageView3;
        
        
        imageView1.backgroundColor = .gray;
        imageView2.backgroundColor = .orange;
        imageView3.backgroundColor = .blue;
        
        
        self.view.addSubview(imageView1);
        self.view.addSubview(imageView2);
        self.view.addSubview(imageView3);
        
        
        imageView1.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left)
            make.width.equalToSuperview().dividedBy(3);
            make.top.equalTo(self.view.snp_top).offset(88);
            make.height.equalTo(100);
        }
        imageView2.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp_top).offset(88);
            make.left.equalTo(imageView1.snp_right);
            make.right.equalTo(imageView3.snp_left)
            make.width.equalToSuperview().dividedBy(3);
            make.height.equalTo(100);
            
        }
        imageView3.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp_top).offset(88);
            make.right.equalToSuperview();
            make.left.equalTo(imageView2.snp_right);
            make.width.equalToSuperview().dividedBy(3);
            make.height.equalTo(100);
        }
    }
    
    
    func setUpWebView() -> () {
        let webView = WKWebView();
        webView.load(NSURLRequest(url:NSURL.init(string:"https://www.baidu.com/")! as URL) as URLRequest);
        self.view.addSubview(webView);
        
        /* WKWebView 的frame 设置*/
        webView.snp.makeConstraints { (make) in
            make.left.equalToSuperview();
            make.top.greaterThanOrEqualTo(self.imageOne.snp_bottom);
            make.width.equalToSuperview()
            make.size.height.equalTo(200);
        }
    }
    
    func getRequest(){
        
        
        Alamofire.request("https://httpbin.org/get").response { (DefaultDataResponse) in
            print("Request: \(DefaultDataResponse.request)")
            print("Response: \(DefaultDataResponse.response)")
            print("Error: \(DefaultDataResponse.error)")
        }
        
    }
    
    func postRequest(){
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
}
