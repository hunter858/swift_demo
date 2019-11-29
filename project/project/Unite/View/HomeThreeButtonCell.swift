//
//  HomeThreeButtonCell.swift
//  project
//
//  Created by edz on 2019/11/8.
//  Copyright © 2019 edz. All rights reserved.
//

import Foundation
import Reusable
import UIKit

class HomeThreeButtonCell: UITableViewCell,Reusable {
    
    let leftButton : UIButton = {
        let button = UIButton.init(frame: .zero)
        button.backgroundColor = UIColor.randomColor
        return button
    }()
    let centerButton : UIButton = {
        let button = UIButton.init(frame: .zero)
        button.backgroundColor = UIColor.randomColor
        return button
    }()
    let rightButton : UIButton = {
        let button = UIButton.init(frame: .zero)
        button.backgroundColor = UIColor.randomColor
        return button
    }()
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        layout()
    }

    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() -> Void {
        
        self.addSubview(leftButton)
        self.addSubview(centerButton)
        self.addSubview(rightButton)
    }
    
    func layout() -> Void {
        leftButton.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(centerButton.snp.left)
        }
        centerButton.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(leftButton.snp.left)
            make.right.equalTo(rightButton.snp.left)
        }
        rightButton.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.right.equalTo(centerButton.snp.left)
        }
    }
    
}
