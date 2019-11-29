//
//  File.swift
//  project
//
//  Created by edz on 2019/11/19.
//  Copyright © 2019 edz. All rights reserved.
//

import Foundation
import UIKit
import Reusable

class SwitchTableViewCell: UITableViewCell,Reusable {

    
    var mySwitch : UISWitch = {
        var mySwitch = UISWitch()
        return mySwitch
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    init
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func setUp() -> Void {
        
    }
    

}


class ImageTableViewCell: UITableViewCell,Reusable {

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    

}
