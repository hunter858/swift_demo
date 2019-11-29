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
    let HeaderIdentifier = "HeaderIdentifier"
    let FooterIdentifier = "HeaderIdentifier"
    
    
    override func viewDidLoad() {
        self.title = "demo4"
        self.view.backgroundColor = UIColor.white;
        
        collectionView.backgroundColor = .white
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
    
    lazy var collectionView: UICollectionView = {
        
        /*
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .vertical
         layout.minimumLineSpacing = 10
         layout.minimumInteritemSpacing = 10
         layout.itemSize = CGSize(width: ScreenWidth/3, height: ScreenWidth/3)
         layout.headerReferenceSize = CGSize.init(width: ScreenWidth, height: 60)
         layout.footerReferenceSize = CGSize.init(width: ScreenWidth, height: 80)
         */
        
        var collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: WaterfallFlowLayout())
        collectionView.register(haohaozhuCollectionCell.self, forCellWithReuseIdentifier: haohaozhuCollectionCell.identifier)
        collectionView.register(haohaozhuHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderIdentifier)
        collectionView.register(haohaozhuFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FooterIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
}


extension demo4ViewControl: UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: haohaozhuCollectionCell.identifier, for:indexPath) as! haohaozhuCollectionCell
        collectionCell.backgroundColor = .red
        let section = indexPath.section
        let row = indexPath.row
        collectionCell.bottomRightLable.text = ("第\(section)组-: \(row)行 ")
        collectionCell.centerLabel.text = "The moon was casting a rainbow through the spray from the waterfallThe moon was casting a rainbow through the spray from the waterfall"
        
        if (indexPath.row % 2) == 0 {
            collectionCell.topImageView.image = UIImage.init(named: "00001")
            
            
        }else{
//            collectionCell.topImageView.image = UIImage.init(named: "00002")
        }
        
        return collectionCell
    }
    
//     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//
//
//        if kind == UICollectionView.elementKindSectionHeader {
//
//            var headerView  = haohaozhuHeader();
//            headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderIdentifier, for: indexPath) as! haohaozhuHeader
//            return headerView
//        }else{
//
//            var footerView = haohaozhuFooter();
//            footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterIdentifier, for: indexPath) as! haohaozhuFooter
//            return footerView
//        }
//
//    }

   
    
    
}
