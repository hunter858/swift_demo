//
//  demo5ViewControl.swift
//  project
//
//  Created by edz on 2019/8/13.
//  Copyright © 2019 edz. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SnapKit
class demo5ViewControl: UIViewController {
    override func viewDidLoad() {
        self.title = "Alamofire使用理解"
        self.view.backgroundColor = UIColor.white;
        
        let button1 :UIButton = UIButton.init(frame: CGRect.zero)
        let button2 :UIButton = UIButton.init(frame: CGRect.zero)
        button1.backgroundColor = .green
        button2.backgroundColor = .gray
        
        button1.setTitle("get请求", for: .normal)
        button2.setTitle("post请求", for: .normal)
        button1.addTarget(self, action: #selector(getRequest), for: .touchUpInside)
        button2.addTarget(self, action: #selector(postRequest), for: .touchUpInside)
        
        view.addSubview(button1)
        view.addSubview(button2)
        
        button1.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(SafeTopHeight)
            make.left.equalToSuperview().offset(10)
            make.height.equalTo(40)
            make.width.equalTo(80)
        }
        button2.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(self.view).offset(SafeTopHeight)
            make.height.equalTo(40)
            make.width.equalTo(80)
           
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @objc func getRequest() -> Void {
     
        let requestUrl :String = "http://m.springtour.com/m/app/queryContent?startCityId=61&orderFrom=2&appBuildNo=304&appBuildNo=304&cityId=985&orderFrom=2&positionId=97&springsign=D231C3399C2F01C778BCEAA65AF47653A3ED17CB&startCityId=61"
        Alamofire.request(requestUrl,method: .get,parameters: nil,encoding: URLEncoding.default,headers:  nil).responseJSON { (response) in
            if response.error == nil{
                // success
                print("Alamofire请求成功：\(response.result.value ?? "")")
            }else{
                //fail
                print("Alamofire fail \(response.error ?? "" as! Error)")
            }
        }
        
        
    }
    
    @objc func postRequest() -> Void {
        
        let URL :String = "http://ai.yiche.com/yc-bot/circleController/getXiaoAiIcon"
        let paramas :[String:String] = [
            "system":"ios",
            "channel":"3",
            "uui":"8c694aadacd1a4583c38a00c00e2b2a0",
            "appId":"10037",
            "version":"9.9.6",
            "token":"d8497fa4-ffb3-42c9-a47a-ae2dade10db3",
            "sign":"aebe139715ac14b78d661d7476d2f81f"]
        Alamofire.request(URL,method: .post,parameters: paramas,encoding: URLEncoding.default,headers: nil).responseJSON { (DataResponse) in
            
            if DataResponse.error == nil{
                print("Alamofire success \(String(describing: DataResponse.response))")
            }else{
                print("Alamofire fail \(String(describing: DataResponse.error))")
            }
        }
        
    }
    
}
