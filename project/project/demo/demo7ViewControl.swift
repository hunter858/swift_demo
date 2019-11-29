//
//  demo7ViewControl.swift
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

class demo7ViewControl: UIViewController {
    
    lazy var tableView : UITableView = {
        let tableview = UITableView()
        tableview.register( UITableViewCell.self, forCellReuseIdentifier:"Cell")
        tableview.tableFooterView = UIView()
        return tableview
    }()
    
    let reloadItem = UIBarButtonItem(title: "刷新", style: .plain, target: self, action: nil)
    let stopItem = UIBarButtonItem(title: "stop", style: .plain, target: self, action: nil)
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        self.title = "demo7"
        self.view.backgroundColor = UIColor.white;
        
        setupData()
        setupUI()
        layoutUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func setupData() -> Void {
    
        
        /*  写死数据 */
//        let items = Observable.just(["文本框的用法","lable 的用法","switch 的用法","control的用法"])
//        items.bind(to: tableView.rx.items) { (tableView, row, element) in
//            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
//            cell.textLabel?.text = "\(row)：\(element)"
//            return cell
//        }
//        .disposed(by: disposeBag)
        
        /*  随机数据 */
        
        let randomResult = reloadItem.rx.tap.asObservable().startWith(()).flatMapLatest{
            self.getRandomResult().takeUntil(self.stopItem.rx.tap)
        }.share(replay: 1)
       //创建数据源
        let dataSource = RxTableViewSectionedReloadDataSource
            <SectionModel<String, Int>>(configureCell: {
                (dataSource, tv, indexPath, element) in
                let cell = tv.dequeueReusableCell(withIdentifier: "Cell")!
                cell.textLabel?.text = "条目\(indexPath.row)：\(element)"
                return cell
            })
         
        //绑定单元格数据
        randomResult.bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        /* 选中点击事件 */
        tableView.rx.itemSelected.subscribe(onNext: { (IndexPath) in
            print(IndexPath)
        
        }).disposed(by: disposeBag)
            
        /* 获取选中项的内容*/
        tableView.rx.modelSelected(String.self).subscribe(onNext: { (item) in
        
            print(item)
        }).disposed(by: disposeBag)
        
        /*  是否允许编辑选项*/
        tableView.rx.itemDeleted.subscribe({ (IndexPath) in
            
            print(IndexPath)
        }).disposed(by: disposeBag)

    }
    

    func getRandomResult() -> Observable<[SectionModel<String,Int>]> {
        let items = (0..<5).map { _ in
            Int(arc4random())
        }
        
        let observable = Observable.just([SectionModel(model: "header", items: items)]);
        
        return observable.delay(2, scheduler: MainScheduler.instance)
    }
        
    
    func setupUI() -> Void {
        self.view.addSubview(tableView)
        self.navigationItem.rightBarButtonItems = [reloadItem,stopItem]
        
    
    }
    func layoutUI() -> Void {
        tableView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
    
}

