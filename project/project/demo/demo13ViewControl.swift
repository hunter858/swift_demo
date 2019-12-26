//
//  demo1ViewControl.swift
//  project
//
//  Created by edz on 2019/8/12.
//  Copyright © 2019 edz. All rights reserved.
//

import Foundation
import UIKit

struct Icon :Decodable {
    var sizes :String? = nil
    var src :String?  = nil
}

struct GitHubModel :Decodable {
    var name:String? = nil
    var icons:[Icon] = []
}

class demo13ViewControl: UIViewController {
    

    
    override func viewDidLoad() {
        self.title = "数据模型解析"
        self.view.backgroundColor = UIColor.white;
        self.getJsonString()
    }
    
    
    func getJsonString () -> Void {
       
        let url = URL(string: "https://github.com/manifest.json")!
        let sesssion = URLSession.shared
        sesssion.dataTask(with: url) { (data, rsponse, error) in
            guard let data = data else{
                return
            }
            do {
                let users = try JSONDecoder().decode(GitHubModel.self, from: data)
                print(users)
            }catch{
                print(error)
            }
        }.resume()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
}

