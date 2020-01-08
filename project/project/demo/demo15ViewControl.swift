//
//  demo15ViewControl.swift
//  project
//
//  Created by edz on 2019/12/26.
//  Copyright © 2019 edz. All rights reserved.
//

import Foundation
import UIKit
 

class demo15ViewControl: UIViewController {
    
    lazy var button1 :UIButton = {
        let button  = UIButton.init(frame: CGRect.zero)
        button.backgroundColor = .gray
        button.setTitle("Moya/RxSwift-request1", for: .normal)
        return button
    }()
    lazy var button2 :UIButton = {
        let button  = UIButton.init(frame: CGRect.zero)
        button.backgroundColor = .gray
        button.setTitle("Moya/RxSwift request2", for: .normal)
        return button
    }()
    lazy var button3 :UIButton = {
        let button  = UIButton.init(frame: CGRect.zero)
        button.backgroundColor = .gray
        button.setTitle("Moya/RxSwiftrequest3", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        self.title = "Moya/RxSwift"
        self.view.backgroundColor = UIColor.white;
        
        self.view.addSubview(button1)
        self.view.addSubview(button2)
        self.view.addSubview(button3)
        self.layoutUI()
    }
    
    func layoutUI(){
        
        button1.addTarget(self, action: #selector(request1), for: .touchUpInside)
        button2.addTarget(self, action: #selector(request2), for: .touchUpInside)
        button3.addTarget(self, action: #selector(request3), for: .touchUpInside)
    
        button1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SafeTopHeight)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        
        button2.snp.makeConstraints { (make) in
            
            make.top.equalTo(button1.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(button1)
        }
        
        button3.snp.makeConstraints { (make) in
            make.top.equalTo(button2.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(button1)
        }
    }

    @objc func request1() -> Void {
        
      
       
        
    }
    @objc func request2() -> Void {
        
    }
    @objc func request3() -> Void {
        
    }
    
    @objc func downloadImage4(){
    }
    
    func setupUI(){
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
}

