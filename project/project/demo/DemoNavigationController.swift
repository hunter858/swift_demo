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
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)]
        navigationBar.tintColor = .black;
    }
    
    
}
