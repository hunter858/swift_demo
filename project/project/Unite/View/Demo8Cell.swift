//
//  File.swift
//  project
//
//  Created by edz on 2019/11/19.
//  Copyright © 2019 edz. All rights reserved.
//

import UIKit
import Foundation
import Reusable
import SnapKit

class SwitchTableViewCell: UITableViewCell,Reusable {

    lazy var mySwitch: UISwitch = {
         let swich = UISwitch()
         swich.isOn = false
         return swich
     }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI (){
        
        self.addSubview(mySwitch)
        mySwitch .snp_makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview();
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    public func getHeight() -> CGFloat {
        return 80
    }

    

}

class ImageTableViewCell: UITableViewCell,Reusable {

    public var rightImageView :UIImageView = {
       var imageView = UIImageView()
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupUI(){
        self.addSubview(rightImageView)
        rightImageView.snp_makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
            make.width.height.lessThanOrEqualTo(40)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func getHeight() ->CGFloat {
        return 100
    }
 
}
