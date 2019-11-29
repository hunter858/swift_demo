//
//  HomeTopCell.swift
//  project
//
//  Created by edz on 2019/11/7.
//  Copyright © 2019 edz. All rights reserved.
//

import Foundation
import UIKit
import Reusable
import SnapKit



class HomeFunctionCell : UITableViewCell,Reusable {
    
    
    var row = 2
    var column = 4
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
   
    
   lazy var collectionView : UICollectionView = {
        
    let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
    

    let itemHeight = 50
    
    let selfSize = self.frame.size
        layout.itemSize = CGSize(width: selfSize.width/CGFloat(self.column), height: 50)
    var collectionView = UICollectionView.init(frame: self.frame, collectionViewLayout: layout)
        collectionView.register(cellType: FunctionItemCollectionCell.self)
        collectionView.isPagingEnabled = true;
        collectionView.delegate = self;
        collectionView.dataSource = self;
        return collectionView
    }()
        
    func setupUI(){
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
    
}


extension HomeFunctionCell :UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: FunctionItemCollectionCell.self)
        cell.backgroundColor = .red
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print( indexPath)
    }
    
    
    
}

/* 子item UIcollectionView*/

class FunctionItemCollectionCell : UICollectionViewCell,Reusable {
    
    
    var topImage  = UIImageView(frame: .zero)
    var bottomLabel = UILabel(frame: .zero)
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setupUI()
//        layout()
    }
    func setupUI() -> Void {
        addSubview(topImage)
        addSubview(bottomLabel)
        
        topImage.backgroundColor = .orange
        bottomLabel.backgroundColor = .green
        bottomLabel.textAlignment = .center
        bottomLabel.font = UIFont.systemFont(ofSize: 13)
        bottomLabel.textColor = .lightGray
        
    }
    func layout() -> Void {
        topImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.width.height.lessThanOrEqualTo(50)
        }
        bottomLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(topImage.snp.bottom)
            make.height.equalTo(18)
            make.left.right.equalToSuperview()
        }
        self.layoutIfNeeded()
    }
    
}
