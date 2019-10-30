//
//  demo3ViewControl.swift
//  project
//
//  Created by edz on 2019/8/13.
//  Copyright © 2019 edz. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class demo3ViewControl: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView();
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.register(demo3TableViewCell.self, forCellReuseIdentifier: demo3TableViewCell.identifier)
        return tableView;
    }()
    
    
    override func viewDidLoad() {
        self.title = "demo3"
        self.view.backgroundColor = UIColor.white;
        
        setupData();
        layoutUI();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        
    }
    
    func setupData() -> () {
        
        
    }
    
    func layoutUI() -> Void {
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.left.bottom.right.equalToSuperview()
        }
    }
}


extension demo3ViewControl: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: demo3TableViewCell.identifier, for: indexPath)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
