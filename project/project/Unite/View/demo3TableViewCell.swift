//
//  demo3TableViewCell.swift
//  project
//
//  Created by edz on 2019/10/29.
//  Copyright © 2019 edz. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


class  demo3TableViewCell: UITableViewCell {
    static let identifier = "demo3TableViewCell";
    
    public  lazy var topLabel : UILabel  = {
        let label = UILabel();
        label.textColor = .darkGray;
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    public  lazy var leftBottomLabel : UILabel  = {
        let label = UILabel();
        label.textColor = .lightGray;
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.numberOfLines = 3
        return label
    }()
    
    public lazy var rightImageView : UIImageView = {
       
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    private func setUpUI (){
        
        
        self.contentView.addSubview(topLabel)
        self.contentView.addSubview(leftBottomLabel)
        self.contentView.addSubview(rightImageView)
        
        
        topLabel.text = "Select the certificates you wish to include in this provisioning profile"
        leftBottomLabel.text = "this profile to install an app, the certificate the app was signed with must be included.this profile to install an app, the certificate the app was signed with must be included."
        rightImageView.image = UIImage(named: "00001")
        
        topLabel.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(marginLeft)
            make.right.equalToSuperview().offset(marginRight)
            make.height.equalTo(16)
        }
        
        leftBottomLabel.snp.makeConstraints { (make) in
            make.top.equalTo(topLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(marginLeft)
            make.bottom.equalToSuperview().offset(-10)
            make.width.lessThanOrEqualTo(ScreenWidth*0.6)
        }
        
        rightImageView.snp.makeConstraints { (make ) in
            make.left.equalTo(leftBottomLabel.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(leftBottomLabel.snp.top)
            make.bottom.equalTo(leftBottomLabel.snp.bottom)
        }
    }
}
