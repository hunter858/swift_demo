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
import Kingfisher



class demo14ViewControl: UIViewController {
    var top1ImageView :UIImageView = {
        var imageView = UIImageView.init(frame:.zero)
        imageView.backgroundColor  = .gray
        return imageView
    }()
    var top2ImageView:UIImageView = {
        var imageView = UIImageView.init(frame:.zero)
        imageView.backgroundColor  = .lightText
        return imageView
    }()
    var top3ImageView:UIImageView = {
        var imageView = UIImageView.init(frame:.zero)
        imageView.backgroundColor  = .gray
        return imageView
    }()
    var top4ImageView:UIImageView = {
        var imageView = UIImageView.init(frame:.zero)
        imageView.backgroundColor  = .lightText
        return imageView
    }()
    
    var button4 :UIButton = {
        var button = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 40, height: 20))
        button.setTitle("下载图片", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        return button
    }()
    
    var dataArray:[String] = {
        let array:[String] = ["https://upload-images.jianshu.io/upload_images/19647101-3e191c07dcfcc75e",
                    "https://upload-images.jianshu.io/upload_images/9518257-7fd69d51c71cf161.jpg",
                    "https://upload-images.jianshu.io/upload_images/1618526-080404c3d37194d0.png",
                    "https://upload-images.jianshu.io/upload_images/1650186-d45eca1563e69523.png",
                    "https://upload-images.jianshu.io/upload_images/18569867-c9a3c9f0436f94d5.png",
                    "https://upload-images.jianshu.io/upload_images/20072974-5886d64c81c075af.png",
                    "https://upload-images.jianshu.io/upload_images/2259045-b8ee04f4735e5e08",
                    "https://upload-images.jianshu.io/upload_images/20264278-42f488588ec3cc1d",
                    "https://upload-images.jianshu.io/upload_images/2038345-451967cce1115331.jpg",
                    "https://upload-images.jianshu.io/upload_images/2038345-64dff577a9d92db9.jpg",
                    "https://upload-images.jianshu.io/upload_images/2038345-a2a209ca5f9659aa.jpg",
                    "https://upload-images.jianshu.io/upload_images/2038345-6d6829399ef5903c.jpg",
                    "https://upload-images.jianshu.io/upload_images/2038345-6c33b3b720a3dfc5.jpg"]
        return array
    }()
    
    override func viewDidLoad() {
        self.title = "Kingfisher简单使用"
        self.view.backgroundColor = UIColor.white;
        setupUI()
        updateData()
    }
    
    func updateData(){
        
        let imageUrl1 = "https://upload-images.jianshu.io/upload_images/19647101-3e191c07dcfcc75e"
        let imageUrl2 = "https://upload-images.jianshu.io/upload_images/9518257-7fd69d51c71cf161.jpg"
        let imageUrl3 = "https://upload-images.jianshu.io/upload_images/1618526-080404c3d37194d0.png"
        
        
        /* 1.只传图片链接*/
        self.top1ImageView.kf.setImage(with: URL.init(string: imageUrl1))
        
        /* 2.链接 + 展位图*/
        self.top2ImageView.kf.setImage(with: URL.init(string: imageUrl2), placeholder: UIImage.init(named: "00006"), options:nil, progressBlock: nil)
        
        /* 3.链接 + 展位图*/
        self.top3ImageView.kf.setImage(with: URL.init(string: imageUrl3), placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
       
        /* 4.链接 + 展位图*/
        
    }
    
    @objc func downloadImage4(){
        
         /* 4.链接 + 展位图*/
        var index :Int = Int(arc4random()%10) + 1
        let imageUrl4 = self.dataArray[index]
        
        self.top4ImageView.kf.indicatorType = .activity
        self.top4ImageView.kf.setImage(with: URL.init(string: imageUrl4), placeholder: nil, options: [.transition(.fade(0.4))], progressBlock: { (receivedSize, totalSize) in
            
            var value =  Float(receivedSize)/Float(totalSize) * 100.0
            print("present: \(value)")
        }, completionHandler: nil)

    }
    
    func setupUI(){
        view.addSubview(top1ImageView)
        view.addSubview(top2ImageView)
        view.addSubview(top3ImageView)
        view.addSubview(top4ImageView)
        view.addSubview(button4)
        
        button4.addTarget(self, action: #selector(downloadImage4), for: .touchUpInside)

        top1ImageView.snp_makeConstraints { (make) in
            make.width.equalTo(160)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(50)
        }
        top2ImageView.snp_makeConstraints { (make) in
           make.width.equalTo(160)
           make.height.equalTo(80)
           make.centerX.equalToSuperview()
            make.top.equalTo(top1ImageView.snp_bottom).offset(10)
        }
        top3ImageView.snp_makeConstraints { (make) in
            make.width.equalTo(160)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
            make.top.equalTo(top2ImageView.snp_bottom).offset(10)
        }
        top4ImageView.snp_makeConstraints { (make) in
            make.width.equalTo(160)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
            make.top.equalTo(top3ImageView.snp_bottom).offset(10)
        }
        
        button4.snp_makeConstraints { (make) in
            make.centerY.equalTo(top4ImageView.snp_centerY)
            make.left.equalTo(top4ImageView.snp_right).offset(10)
        }
        
        
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        /*
         public enum KingfisherOptionsInfoItem {

             这个成员的关联值是一个ImageCache对象。 Kingfisher使用指定的缓存对象处理 相关业务,包括试图检索缓存图像和存储下载的图片。
             case targetCache(ImageCache)

             这个成员的关联值应该是一个ImageDownloader对象。Kingfisher将使用这个下载器下载的图片。
             case downloader(ImageDownloader)

             如果从网络下载的图片 Kingfisher将使用“ImageTransition这个枚举动画。从内存或磁盘缓存时默认过渡不会发生。如果需要,设置ForceTransition
             case transition(ImageTransition)

             有关“浮动”值将被设置为图像下载任务的优先级。值在0.0 ~ 1.0之间。如果没有设置这个选项,默认值(“NSURLSessionTaskPriorityDefault”)将被使用。
             case downloadPriority(Float)

             如果设置,将忽略缓存,开启一个下载任务的资源
             case forceRefresh
             
             如果设置 即使缓存的图片也将开启过渡动画
             case forceTransition

             如果设置，Kingfisher只会在内存中缓存值而不是磁盘
             case cacheMemoryOnly

             如果设置 Kingfisher只会从缓存中加载图片
             case onlyFromCache
             
             在使用之前在后台线程解码图像
             case backgroundDecode
             
             当从缓存检索图像时 这个成员的关联值将被用作目标队列的调度时回调。如果没 有设置, Kingfisher将使用主要quese回调
             case callbackDispatchQueue(DispatchQueue?)
             
             将检索到的图片数据转换成一个图时 这个成员变量将被用作图片缩放因子。图像分辨率,而不是屏幕尺寸。你可能处理时需要指定正确的缩放因子@2x或@3x Retina图像。
             case scaleFactor(CGFloat)
             
             是否所有的GIF应该加载数据。默认false，只显示GIF中第一张图片。如果true,所有的GIF数据将被加载到内存中进行解码。这个选项主要是用于内部的兼容性。你不应该把直接设置它。“AnimatedImageView”不会预加载所有数据,而一个正常的图像视图(“UIImageView”或“NSImageView”)将加载所有数据。选择使用相应的图像视图类型而不是设置这个选项。
             case preloadAllGIFData
           
             发送请求之前用于改变请求。这是最后的机会你可以修改请求。您可以修改请求一些定制的目的,如添加身份验证令牌头,进行基本的HTTP身份验证或类似的url映射。原始请求默认情况下将没有任何修改
             case requestModifier(ImageDownloadRequestModifier)
             
             下载完成时,处理器会将下载的数据转换为一个图像。如果缓存连接到下载器(当你正在使用KingfisherManager或图像扩展方法),转换后的图像也将被缓存
             case processor(ImageProcessor)
             
             提供一个CacheSerializer 可用于图像对象序列化成图像数据存储到磁盘缓存和从磁盘缓存将图片数据反序列化成图像对象
             case cacheSerializer(CacheSerializer)
             
             保持现有的图像同时设置另一个图像图像视图。通过设置这个选项,imageview的placeholder参数将被忽略和当前图像保持同时加载新图片
             case keepCurrentImageWhileLoading
         }
         */
    }
}

