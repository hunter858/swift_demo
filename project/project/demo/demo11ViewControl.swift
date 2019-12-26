//
//  demo1ViewControl.swift
//  project
//
//  Created by edz on 2019/8/12.
//  Copyright © 2019 edz. All rights reserved.
//

import Foundation
import UIKit



class demo11ViewControl: UIViewController {
    
    let ScreenWidth = UIScreen.main.bounds.width
    let ScreenHeight = UIScreen.main.bounds.height
    var imageView: UIImageView!
    let imageViewHeight: Int = 200
    let rowHeight = 64
    let rowCount = 8
    
    
    var myTableView :UITableView!
    var barImageView :UIView?
    
    override func viewDidLoad() {
        self.title = "仿QQ背景"
        self.view.backgroundColor = UIColor.white;
        setUpUI()
    }
    
    func setUpUI(){
        
        self.barImageView = self.navigationController?.navigationBar.subviews.first
//        self.navigationController?.navigationBar.alpha = 0
//        self.navigationController?.navigationBar.isTranslucent = true
         
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(color: .clear), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        
        let scrollView = UIScrollView()
        scrollView.frame = self.view.frame
        scrollView.contentSize = CGSize(width: ScreenWidth, height:CGFloat( rowCount * rowHeight) )
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = self;
        self.view.addSubview(scrollView)
        /* imageView*/
        self.imageView = UIImageView()
        self.imageView.frame = CGRect.init(x: 0, y: 0, width: Int(ScreenWidth), height: Int(imageViewHeight))
        self.imageView.image = UIImage.init(named: "pikaqiu")
        self.imageView.contentMode = .scaleAspectFill
        scrollView.addSubview(self.imageView)
        /* tableView*/
        self.myTableView = UITableView(frame: CGRect(x: 0, y: Int(imageViewHeight), width: Int(ScreenWidth), height: rowHeight * rowCount), style: .plain)
        self.myTableView.delegate = self;
        self.myTableView.dataSource = self;
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        self.myTableView.tableFooterView = UIView.init()
        scrollView.addSubview(self.myTableView)
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
       super .viewWillAppear(animated)
        self.navigationController?.delegate = self;
    }
}

extension demo11ViewControl :UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        if (offset < 0) {
//           let scale = abs(offset)/(imageViewHeight)
//           let scaleTransform = CGAffineTransformMakeScale(1 + scale, 1 + scale)
//           let translationTransform = CGAffineTransformMakeTranslation(0, offset/2)
//           let concatTransform = CGAffineTransformConcat(scaleTransform, translationTransform)
        } else if (offset > 0) {
            self.imageView.transform = CGAffineTransform(translationX: 0, y: offset * 0.6)
        }else {
//             self.imageView.transform = CGAffineTransformIdentity
        }
        
//        var alphaValue = offset / CGFloat(imageViewHeight - 64)
//        alphaValue = CGFloat.maximum(alphaValue, 0)
//        self.barImageView?.alpha = alphaValue
    
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")!
        return cell
    }
    
    
}


extension demo11ViewControl :UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController == self {
            self.navigationController?.navigationBar.tintColor = .white
            self.navigationController?.navigationBar.isTranslucent = true
        }else{
            self.navigationController?.navigationBar.alpha = 1
            self.navigationController?.navigationBar.tintColor = nil
            self.navigationController?.navigationBar.isTranslucent = false
        }
        
    }
}


extension UIImage {
    
    //
    class func imageWithColor(color: UIColor)->UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image  = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
