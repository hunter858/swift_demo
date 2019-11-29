//
//  demo6ViewControl.swift
//  project
//
//  Created by edz on 2019/8/13.
//  Copyright © 2019 edz. All rights reserved.
//

import Foundation
import UIKit
import Moya
import Result


class demo6ViewControl: UIViewController {
    
    let homeApi = HomeProvider
    
    lazy var button1 :UIButton = {
        let button  = UIButton.init(frame: CGRect.zero)
        button.backgroundColor = .gray
        button.setTitle("request1", for: .normal)
        return button
    }()
    lazy var button2 :UIButton = {
        let button  = UIButton.init(frame: CGRect.zero)
        button.backgroundColor = .gray
        button.setTitle("request2", for: .normal)
        return button
    }()
    lazy var button3 :UIButton = {
        let button  = UIButton.init(frame: CGRect.zero)
        button.backgroundColor = .gray
        button.setTitle("request3", for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        self.title = "Moya体验"
        self.view.backgroundColor = UIColor.white;
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        self.layoutUI()
    }
    func layoutUI(){
        
        
        button1.addTarget(self, action: #selector(request1), for: .touchUpInside)
        button2.addTarget(self, action: #selector(request2), for: .touchUpInside)
        button3.addTarget(self, action: #selector(request3), for: .touchUpInside)
    
        button1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SafeTopHeight)
            make.left.equalTo(self.view)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        
        button2.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(SafeTopHeight)
            make.left.equalTo(button1.snp.right).offset(10)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        
        button3.snp.makeConstraints { (make) in
            make.top.equalTo(button1.snp.bottom).offset(10)
            make.left.equalTo(self.view)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
    }
    
    @objc func request1() -> Void {
     
       
        homeApi.request(.app) { result in
            
            switch result {
            case let .success(result):
                
               do {
                  try print("result.mapJSON() = \(result.mapJSON())")
               } catch {
                   print("MoyaError.jsonMapping(result) = \(MoyaError.jsonMapping(result))")
               }
            case let .failure(error):
                print(error)
            }
        }
        
        
    }
    
    @objc func request2() -> Void {
        
        homeApi.request(.router) { (result) in
            switch result {
            case let .success(result):
                do {
                   try print("router 接口 = \( result.mapJSON() )")
                } catch {
                    print("MoyaError.jsonMapping(result) = \(MoyaError.jsonMapping(result))")
                }
                
            case let .failure(error):
                print("router 接口 error")
            }
        }
        
    }
    
    @objc func request3() -> Void {
        
        homeApi.request(.getVersion) { (result) in
            
            switch result {
               case let .success(result):
                  
                print("router 接口 = \( result.data )")
               case let .failure(error):
                print("router 接口 error")
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
}
