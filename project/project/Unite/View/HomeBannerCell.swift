//
//  File.swift
//  project
//
//  Created by edz on 2019/11/8.
//  Copyright © 2019 edz. All rights reserved.
//

import Foundation
import UIKit
import Reusable

class HomeBannerCell: UITableViewCell,Reusable {
    
    let topImageView : UIImageView = {
        let imageView = UIImageView.init(frame: .zero)
//        imageView.backgroundColor = .red
        return imageView
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
        self.addSubview(topImageView)
    }
    func layout() -> Void {
        topImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}
