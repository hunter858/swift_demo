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

class haohaozhuCollectionCell: UICollectionView {
    
    static let identifier = "haohaozhuCollectionCell"
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
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
        return label
    }()
    
    
    func layoutUI() -> () {
        
        self.addSubview(topImageView)
        self.addSubview(centerLabel)
        self.addSubview(bottomLeftIcon)
        self.addSubview(bottomRightLable)
        
        topImageView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
        }
        centerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(topImageView.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
        }
        bottomLeftIcon.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
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
