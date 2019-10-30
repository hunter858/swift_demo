//
//  demo4ViewControl.swift
//  project
//
//  Created by edz on 2019/8/13.
//  Copyright © 2019 edz. All rights reserved.
//

import Foundation
import UIKit

class demo4ViewControl: UIViewController {
    override func viewDidLoad() {
        self.title = "demo4"
        self.view.backgroundColor = UIColor.white;
    }
    
    lazy var collection: UICollectionView = {
        let collectionview = UICollectionView()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        collectionview.register(haohaozhuCollectionCell.self, forCellWithReuseIdentifier: haohaozhuCollectionCell.identifier)
        collectionview.dataSource = self
        collectionview.delegate = self
      
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
}


extension demo4ViewControl :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
}
