//
//  demo9ViewControl.swift
//  project
//
//  Created by edz on 2019/11/14.
//  Copyright © 2019 edz. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxDataSources
import RxSwift

enum SectionItem {
    case TitleImageSectionItem (title: String, image: UIImage)
    case TitleSwitchSectionItem (title: String ,enable : Bool)
}

struct TypeSection {
    var header: String
    var items: [SectionItem]
}

extension TypeSection : SectionModelType{
    typealias Item  = SectionItem
    init(original: Self, items: [Self.Item]) {
        self = original
        self.items = items
    }
    
}

class demo9ViewControl: UIViewController {
    
    override func viewDidLoad() {
        self.title = "不同cell 同一个tableView"
        self.view.backgroundColor = UIColor.white;

    }
    
    let myTableView : UITableView = {
        let tableview = UITableView(frame: CGRect.zero, style: .plain)
        return tableview
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func setUpData() -> Void {
        
        let section1 = TypeSection(header: "first Section", items: [.TitleImageSectionItem(title: "one", image: UIImage(named: "00001")!),
                                                                .TitleSwitchSectionItem(title: "two", enable: true),
                                                                .TitleSwitchSectionItem(title: "three", enable: false)
        ])
        let section2 = TypeSection(header: "second Section", items: [.TitleImageSectionItem(title: "four", image: UIImage(named: "00002")!),
                                                                .TitleImageSectionItem(title: "five", image: UIImage(named: "00003")!),
                                                                .TitleSwitchSectionItem(title: "six", enable: false)
        ])
        
        let sections = Observable.just([section1,section2])
        
        
        //创建数据源

        
        
        let dataSource = RxTableViewSectionedReloadDataSource<TypeSection>(
        
            configureCell: { dataSource,tableView,indexPath,element in
                
                switch dataSource[indexPath]{
                case let .TitleImageSectionItem:
                    let cell  = tableView.dequeueReusableCell(withIdentifier: "TitleImageSectionItem", for: indexPath)
                    return cell
                case .TitleSwitchSectionItem:
                    let cell  = tableView.dequeueReusableCell(withIdentifier: "TitleSwitchSectionItem", for: indexPath)
                }
                
        })
        
    }
    
    func setupUI() -> Void {
        self.view.addSubview(myTableView)
       
        
    }
    
    func layoutUI() -> Void {
        myTableView.snp.makeConstraints { (make) in
                   make.edges.equalToSuperview()
            }
    }
    
}
