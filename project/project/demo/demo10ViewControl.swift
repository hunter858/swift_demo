//
//  File.swift
//  project
//
//  Created by edz on 2019/11/14.
//  Copyright © 2019 edz. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import Toast_Swift

class demo10ViewControl: UIViewController {
 
    var button1,button2,button3,button4,button5,button6,button7,button8,button9,button10,button11: UIButton?
    var buttonArray = [Any]()
    var disposebag = DisposeBag()
    
    override func viewDidLoad() {
        self.title = "toast-swift 简单用法"
        self.view.backgroundColor = UIColor.white;
        self.setupUI()
        self.layoutUI()
        self.setupFunc()
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func createButtonWithTitle(title: String) -> UIButton {
        var button = UIButton(frame: .zero)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }
    
    func setupUI() {
         button1 = self.createButtonWithTitle(title: "makeToast1")
         button2 = self.createButtonWithTitle(title: "显示带图片的toast 带详情")
         button3 = self.createButtonWithTitle(title: "显示loading")
         button4 = self.createButtonWithTitle(title: "隐藏loading")
         button5 = self.createButtonWithTitle(title: "自定义样式")
         button6 = self.createButtonWithTitle(title: "makeToast6")
         button7 = self.createButtonWithTitle(title: "makeToast7")
         button8 = self.createButtonWithTitle(title: "makeToast8")
         button9 = self.createButtonWithTitle(title: "makeToast9")
         button10 = self.createButtonWithTitle(title: "makeToast10")
         button11 = self.createButtonWithTitle(title: "makeToast11")
        self.view.addSubview(button1!);
        self.view.addSubview(button2!);
        self.view.addSubview(button3!);
        self.view.addSubview(button4!);
        self.view.addSubview(button5!);
        self.view.addSubview(button6!);
        self.view.addSubview(button7!);
        self.view.addSubview(button8!);
        self.view.addSubview(button9!);
        self.view.addSubview(button10!);
        self.view.addSubview(button11!);
    

    }
    
    
    func layoutUI() {

        button1?.snp_makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.width.greaterThanOrEqualTo(120)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
        button2?.snp_makeConstraints { (make) in
            make.top.equalTo(self.button1!.snp_bottom).offset(10)
            make.width.greaterThanOrEqualTo(120)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
        self.button3?.snp_makeConstraints { (make) in
            make.top.equalTo(self.button2!.snp_bottom).offset(10)
            make.width.greaterThanOrEqualTo(120)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
        self.button4?.snp_makeConstraints { (make) in
            make.top.equalTo(self.button3!.snp_bottom).offset(10)
            make.width.greaterThanOrEqualTo(120)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
        self.button5?.snp_makeConstraints { (make) in
            make.top.equalTo(self.button4!.snp_bottom).offset(10)
            make.width.greaterThanOrEqualTo(120)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
        self.button6?.snp_makeConstraints { (make) in
            make.top.equalTo(self.button5!.snp_bottom).offset(10)
            make.width.greaterThanOrEqualTo(120)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
        self.button7?.snp_makeConstraints { (make) in
            make.top.equalTo(self.button6!.snp_bottom).offset(10)
            make.width.greaterThanOrEqualTo(120)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
        self.button8?.snp_makeConstraints { (make) in
            make.top.equalTo(self.button7!.snp_bottom).offset(10)
            make.width.greaterThanOrEqualTo(120)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
        self.button9?.snp_makeConstraints { (make) in
            make.top.equalTo(self.button8!.snp_bottom).offset(10)
            make.width.greaterThanOrEqualTo(120)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
        self.button10?.snp_makeConstraints { (make) in
            make.top.equalTo(self.button9!.snp_bottom).offset(10)
            make.width.greaterThanOrEqualTo(120)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
        self.button11?.snp_makeConstraints { (make) in
            make.top.equalTo(self.button10!.snp_bottom).offset(10)
            make.width.greaterThanOrEqualTo(120)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
        
        
    }
    
    func setupFunc (){
        /* 1 */
        self.button1?.rx.tap.subscribe(onNext: { [weak self] in
            self?.view.makeToast("按钮被点击")
        }).disposed(by: disposebag)
        
        /* 2 */
        self.button2?.rx.tap.subscribe(onNext:{
            
            let centerPoint = CGPoint.init(x: self.view.centerX, y: self.view.centerY)
            self.view.makeToast("toast massaagetoast massaagetoast massaagetoast massaagetoast massaagetoast massaagetoast massaage", point: centerPoint, title: "title", image: UIImage(named: "00001")) { (complectValue) in
                print("complect:\(complectValue)")
            }
        }).disposed(by: disposebag)
        
        /* 3 */
        self.button3?.rx.tap.subscribe(onNext:{
            let centerPoint = self.view.center
            self.view.makeToastActivity(centerPoint)
            
        }).disposed(by: disposebag)
        
        /* 4 */
        self.button4?.rx.tap.subscribe(onNext:{
            
            self.view.hideToastActivity()
            
        }).disposed(by: disposebag)
        
        /* 5 */
        self.button5?.rx.tap.subscribe(onNext:{
            let centerPoint = self.view.center
            var style = ToastStyle()
            style.messageColor = .orange
            style.titleColor = .orange
            style.backgroundColor = .white
            self.view.makeToast("content value", duration: 4.0, point: centerPoint, title: "I am title", image: UIImage(named: "00002"), style: style) { (value) in
                print("value:\(value)")
            }
            
            /*
             makeToast("customer styles", duration: 4, point: nil, title: "I am title", image: nil, style: style) { (complectValue) in
                 print("customer style :\(complectValue)")
             }
             */
            
        }).disposed(by: disposebag)
        
        /* 6 */
        self.button6?.rx.tap.subscribe(onNext:{
            
            
        }).disposed(by: disposebag)
        
        /* 7 */
        self.button7?.rx.tap.subscribe(onNext:{
            
            
        }).disposed(by: disposebag)
        
        /* 8 */
        self.button8?.rx.tap.subscribe(onNext:{
            
            
        }).disposed(by: disposebag)
        
        /* 9 */
        self.button9?.rx.tap.subscribe(onNext:{
            
            
        }).disposed(by: disposebag)
        
        /* 10 */
        self.button10?.rx.tap.subscribe(onNext:{
            
            
        }).disposed(by: disposebag)
        
        /* 11 */
        self.button11?.rx.tap.subscribe(onNext:{
            
            
        }).disposed(by: disposebag)
        
        
    }
    
}
