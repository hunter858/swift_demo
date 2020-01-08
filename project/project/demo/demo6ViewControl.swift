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
import RxSwift


class demo6ViewControl: UIViewController {
    
    let homeApi = HomeProvider
    let disposebag = DisposeBag()
    
    lazy var button1 :UIButton = {
   
        return self.createButtonWithTitle("request1")
    }()
    lazy var button2 :UIButton = {
        
        return self.createButtonWithTitle("request2")
    }()
    lazy var button3 :UIButton = {
       
        return self.createButtonWithTitle("request3")
    }()
    
    lazy var button4 :UIButton = {
       
        return self.createButtonWithTitle("json转模型")
    }()
    
    lazy var button5 :UIButton = {

        return self.createButtonWithTitle("新功能2")
    }()
    
    lazy var button6 :UIButton = {
       
        return self.createButtonWithTitle("新功能2")
    }()
    
    
    override func viewDidLoad() {
        self.title = "Moya体验"
        self.view.backgroundColor = UIColor.white;
       
        self.layoutUI()
    }
    
    
    func createButtonWithTitle(_ title:String?="") ->UIButton{
        let button  = UIButton.init(frame: CGRect.zero)
        button.backgroundColor = .gray
        button.setTitle(title, for: .normal)
        return button
    }
    
     @objc func reques5(){

            
        homeApi.rx.request(.getVersion, callbackQueue: DispatchQueue.main)
            .asObservable()
            .map(HomeApiModel.self)
            .subscribe(onNext: { (response) in
                print(response)
            }, onError: { (error) in
                print(error)
            }).disposed(by: disposebag)
        
    
            
        }
        @objc func reques6(){
               
        }
        @objc func reques7(){
               
        }
    
    func layoutUI(){
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(button4)
        view.addSubview(button5)
        view.addSubview(button6)
        
        button1.addTarget(self, action: #selector(request1), for: .touchUpInside)
        button2.addTarget(self, action: #selector(request2), for: .touchUpInside)
        button3.addTarget(self, action: #selector(request3), for: .touchUpInside)
        button4.addTarget(self, action: #selector(reques4), for: .touchUpInside)
        button5.addTarget(self, action: #selector(reques5), for: .touchUpInside)
        button6.addTarget(self, action: #selector(reques6), for: .touchUpInside)
    
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
        button4.snp.makeConstraints { (make) in
            make.top.equalTo(button3.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(button1)
        }
        button5.snp.makeConstraints { (make) in
            make.top.equalTo(button4.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(button4)
        }
        button6.snp.makeConstraints { (make) in
            make.top.equalTo(button5.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(button5)
        }
        
    }
    
    @objc func request1() -> Void {
     
       
        homeApi.request(.app) { result in
            
            switch result {
            case let .success(result):
                
               do {
                let data = result.data
                let responseCode = result.statusCode
                
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
                                
                if var model = result.data.toModel(modelType: HomeApiModel.self){
                    print( model.landingPage?.isLife ?? "")
                    print( model.landingPage?.isUIWebView ?? "")
                }
                
        
                print("router 接口 = \( result.data.toDictionary() )")
               case let .failure(error):
                print("router 接口 error")
            }
        }
        
    }
        
    @objc func reques4(){
    let json = """
          {
              "landingPage": {
                  "home": {
                      "topCarousel": {
                          "positionId": 97,
                          "versionNo": "1578363731000"
                      },
                      "middleNavigation": {
                          "positionId": 98,
                          "versionNo": "1578016434000"
                      },
                      "timeLimit": {
                          "positionId": 99
                      },
                      "preferential": {
                          "positionId": 105
                      },
                      "tab": {
                          "positionId": 100
                      },
                      "activitygif": {
                          "positionId": 738
                      },
                      "recommend": {
                          "positionId": 101
                      }
                  },
                  "isUIWebView": "false",
                  "isLife": "true"
              }
          }
          """.data(using: .utf8)!

          let decoder = JSONDecoder()
           do {
               let product = try decoder.decode(HomeApiModel.self, from: json)
            print("(product.landingPage?.isLife \(String(describing: product.landingPage?.isLife))")
           
            } catch {
               print(error)
           }
    }
    
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
}
