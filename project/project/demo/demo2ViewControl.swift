//
//  demo2ViewControl.swift
//  project
//
//  Created by edz on 2019/8/13.
//  Copyright © 2019 edz. All rights reserved.
//

import Foundation
import UIKit

class demo2ViewControl: UIViewController {
    
    let label = UILabel()
    let button = UIButton(type: .custom)
    
    override func viewDidLoad() {
        self.title = "demo2"
        self.view.backgroundColor = UIColor.white;
        self.setupViews();
        self.setupViews1();
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    func setupViews(){
    
        label.text = " I am a little Label"
        label.textAlignment = NSTextAlignment.center;
        self.view.addSubview(label);
        
        button.setTitle("Im a Button", for:.normal);
        button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        button.layer.borderColor = UIColor.darkGray.cgColor;
        button.layer.borderWidth = 1;
        button.layer.cornerRadius = 10;
        self.view.addSubview(button);
        
        label.snp.makeConstraints { (make) in
            make.width.equalTo(100);
            make.centerX.equalToSuperview();
            make.top.equalToSuperview().offset(100);
        }

        button.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: SafeTopHeight+10, left: 10, bottom: SafeBottomHeight+10, right: 10));
        }
        
    }
    

    func setupViews1() {
        
        
        let view1 :UIButton =  UIButton(type: .custom);
        view1.backgroundColor = UIColor.green;
        self.view.addSubview(view1);
        view1.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30);
            ConstraintMaker.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30);
            ConstraintMaker.left.equalToSuperview().offset(30);
            ConstraintMaker.right.equalToSuperview().offset(-30);
        }
        
        
    }
    
    
    /*
     需要暴露给ObjecC使用的方法
     */
    
    @objc  func clickButton() {

        
        
    }
    
}
