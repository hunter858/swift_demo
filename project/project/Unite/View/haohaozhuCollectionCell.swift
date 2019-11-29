//
//  haohaozhuCollectionCell.swift
//  project
//
//  Created by edz on 2019/10/29.
//  Copyright © 2019 edz. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class haohaozhuCollectionCell: UICollectionViewCell {
    
    static let identifier = "haohaozhuCollectionCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    
     
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    
    lazy var topImageView :UIImageView = {
        let view = UIImageView()
        return view
    }()
    lazy var centerLabel :UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 2
        return label
    }()
    lazy var bottomLeftIcon :UIImageView = {
        let view = UIImageView()
        return view
    }()
    lazy var bottomRightLable :UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    
    func layoutUI() -> () {
        
        bottomLeftIcon.image = UIImage.init(named: "00006")
//        topImageView.image = UIImage.init(named: "00001")
        topImageView.backgroundColor = UIColor.randomColor
        centerLabel.text = ""
        bottomRightLable.text = NSString.init(string: "2018-10-03") as String
        self.addSubview(topImageView)
        self.addSubview(centerLabel)
        self.addSubview(bottomLeftIcon)
        self.addSubview(bottomRightLable)
        
        topImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.lessThanOrEqualToSuperview()
            make.bottom.equalTo(centerLabel.snp.top)
        }
        centerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(topImageView.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
        }
        bottomLeftIcon.snp.makeConstraints { (make) in
            make.left.bottom.equalToSuperview()
            make.top.equalTo(centerLabel.snp.bottom)
            make.width.height.equalTo(10)
        }
        bottomRightLable.snp.makeConstraints { (make) in
            make.left.equalTo(bottomLeftIcon.snp.right).offset(10)
            make.top.bottom.equalTo(bottomLeftIcon)
            make.right.equalToSuperview()
        }

    }
    
}


class haohaozhuHeader: UICollectionReusableView {
    
    static let identifier = "haohaozhuHeader"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    lazy var topLable : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .lightGray
        return label
    }()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupSubView() -> Void {
        self.addSubview(imageView)
        self.addSubview(topLable)
        imageView.backgroundColor = .orange
        topLable.backgroundColor = .orange
        topLable.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview().offset(10)
            make.height.equalTo(18)
        }
        
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(topLable.snp.bottom).offset(10)
            make.left.bottom.right.equalToSuperview().offset(10)
        }

    }
    
}


class haohaozhuFooter: UICollectionReusableView {
    
    static let identifier = "haohaozhuFooter"
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var topLable : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .lightGray
        return label
    }()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupSubView() -> Void {
        self.addSubview(imageView)
        imageView.backgroundColor = .green
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().offset(10)
        }
    }
}
