//
//  DemoNavigationController.swift
//  project
//
//  Created by edz on 2019/10/29.
//  Copyright © 2019 edz. All rights reserved.
//

import Foundation
import UIKit

class CustomerNavigationController :UINavigationController{
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isTranslucent = false;
        let navigationBar = UINavigationBar.appearance()
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)]
        self.navigationBar.barTintColor = UIColor.init(red: 163/255, green: 195/255, blue: 227/255, alpha: 1)

        
    }
    
    
}
