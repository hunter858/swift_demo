//
//  demo8ViewControl.swift
//  project
//
//  Created by edz on 2019/8/13.
//  Copyright © 2019 edz. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxDataSources
import RxSwift

/* 自定义结构体*/

struct MySection {
    var header:String
    var items:[Item]
}

extension MySection :AnimatableSectionModelType{
    typealias Item = String
    var identity: String {
        return header
    }
    init(original: Self, items: [Item]) {
        self = original
        self.items = items
    }
}

class demo8ViewControl: UIViewController {
    
    lazy var tableView : UITableView = {
        let tableview = UITableView()
        tableview.register(UITableViewCell.self ,forCellReuseIdentifier: "tableViewCell")
        tableview.tableFooterView = UIView()
        return tableview
    }()
    
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        self.title = "自定义section"
        self.view.backgroundColor = UIColor.white;
        setupUI()
        layoutUI()
        
        /* 定义数据源*/
        let sections = Observable.just([MySection(header: "header section", items: ["one row",
                                                                     "two row",
                                                                     "three row",
                                                                     "four row",
                                                                     "five row"])]);

        /* 定义RxDataSource */
        let dataSource = RxTableViewSectionedAnimatedDataSource<MySection>(
           configureCell: {ds,tableView,indexPath,element in
               let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") ?? UITableViewCell(style: .default, reuseIdentifier: "tableViewCell")
               cell.textLabel?.text = "\(indexPath.row) \(element)"
               return cell
        })

        /* 处理header 信息*/
        dataSource.titleForHeaderInSection = { dataSource,IndexPath in
           
           return dataSource.sectionModels[IndexPath].header;
        }

        sections.bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        
    }
    
    func setupUI() -> Void {
        self.view.addSubview(tableView)
        let reloadItem  = UIBarButtonItem.init(title: "刷新", style: .plain, target: self, action:#selector(reloadFunc))
        let stopItem = UIBarButtonItem.init(title: "暂停", style: .plain, target: self, action:#selector(stopFunc))
        self.navigationItem.setRightBarButtonItems([reloadItem,stopItem], animated: true)
        
    }
    
    @objc func stopFunc(){
        
    }
    
    @objc func reloadFunc(){
        
    }
    

    func layoutUI() -> Void {
        tableView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
    
}



