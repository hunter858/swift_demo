//
//  demo1ViewControl.swift
//  project
//
//  Created by edz on 2019/8/12.
//  Copyright © 2019 edz. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class demo12ViewControl: UIViewController {
    
    var style: UIStatusBarStyle = .default
    
    override func viewDidLoad() {
        self.title = "动态改变状态栏"
        self.view.backgroundColor = UIColor.orange
        self.setupUI()
    }
    
    func setupUI(){
        
        let button = UIButton.init(frame:CGRect.init(x: 0, y: 100, width: 120, height: 20))
        button .addTarget(self, action: #selector(changeStatus), for: .touchUpInside)
        button.setTitle("change Navigation", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        self.view.addSubview(button)
        button.snp_makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        
    }
    
    /* 重现statusBar相关方法 */
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return self.style
    }
    
    @objc func changeStatus(){
//        /* 没有用外部的Navigation */
//        if style == .lightContent {
//            self.style  = .default
//        }else{
//            self.style = .lightContent
//        }
//        setNeedsStatusBarAppearanceUpdate()
     
        /*  用了外部的navigation 需要先隐藏才可以*/
        if let isHidden = self.navigationController?.isNavigationBarHidden {
            /* 如果 隐藏了，会进入该判断*/
            self.navigationController?.isNavigationBarHidden = !isHidden
            self.style = (!isHidden) ? .lightContent: .default
            setNeedsStatusBarAppearanceUpdate()
        }
        
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
}

