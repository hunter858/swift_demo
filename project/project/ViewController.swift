//
//  ViewController.swift
//  project
//
//  Created by edz on 2019/8/12.
//  Copyright © 2019 edz. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    var dataSource:[NSDictionary] = []
    override func viewDidLoad() {
        super.viewDidLoad()


        self.loadData();
        self.addTableView();
    }
    func loadData() -> Void {
        
        let model1: NSDictionary = ["key":"demo1简单布局","control":demo1ViewControl.init()];
        let model2: NSDictionary = ["key":"UITableView使用demo2","control":demo2ViewControl.init()];
        let model3: NSDictionary = ["key":"UITableView使用demo3","control":demo3ViewControl.init()];
        let model4: NSDictionary = ["key":"UICollectionView使用demo4","control":demo4ViewControl.init()];
        let model5: NSDictionary = ["key":"demo5-Alamofire","control":demo5ViewControl.init()];
        let model6: NSDictionary = ["key":"demo6-moya","control":demo6ViewControl.init()];
        let model7: NSDictionary = ["key":"UITableView RxSwift的简单使用","control":demo7ViewControl.init()];
        let model8: NSDictionary = ["key":"RxDataSource简单使用","control":demo8ViewControl.init()];
        let model9: NSDictionary = ["key":"不同cell同一个tableView","control":demo9ViewControl.init()];
        let model10: NSDictionary = ["key":"UITableView使用demo10","control":demo10ViewControl.init()];
        let model11: NSDictionary = ["key":"仿qq滚动背景","control":demo11ViewControl.init()];
        let model12: NSDictionary = ["key":"改变导航头的样式","control":demo12ViewControl.init()];
        let model13: NSDictionary = ["key":"数据模型解析","control":demo13ViewControl.init()];
        let model14: NSDictionary = ["key":"kingfisher简单使用","control":demo14ViewControl.init()];
        
        
        
        var dataSource:Array<NSDictionary> = [NSDictionary]();
        dataSource.append(model1);
        dataSource.append(model2);
        dataSource.append(model3);
        dataSource.append(model4);
        dataSource.append(model5);
        dataSource.append(model6);
        dataSource.append(model7);
        dataSource.append(model8);
        dataSource.append(model9);
        dataSource.append(model10);
        dataSource.append(model11);
        dataSource.append(model12);
        dataSource.append(model13);
        dataSource.append(model14);

        self.dataSource = dataSource;
    }

   func setupView(){
        let customerView = UIView(frame:CGRect(x: 0, y: 0, width: 100, height: 100));
        customerView.backgroundColor = UIColor.yellow;
        self.view.addSubview(customerView);
    }
    
    func addTableView() -> Void {
        
        let tableView = UITableView(frame: .zero);
        self.view.addSubview(tableView);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.snp_makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "tableviewCell_identifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier);
        if cell==nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
        }
        let object = self.dataSource[indexPath.row];
        cell?.textLabel?.text = (object["key"] as! String);
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let _:demo1ViewControl = demo1ViewControl()
        
        let ObjectModel = self.dataSource[indexPath.row];
        let Control :UIViewController =  ObjectModel["control"] as? UIViewController ?? UIViewController.init();
        self.navigationController?.pushViewController(Control, animated:true);
        
        
    }
}

