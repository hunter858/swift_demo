//
//  HomeTopFlowLayout.swift
//  project
//
//  Created by edz on 2019/11/8.
//  Copyright © 2019 edz. All rights reserved.
//

import Foundation
import UIKit
class WaterfallFlowLayout : UICollectionViewFlowLayout {
    
    private(set) var ColumnCountDefault : Int = 3
    /** 每一列之间的间距 垂直 */
    private(set) var ColumnMargin : CGFloat = 10.0
    /** 每一行之间的间距 水平方向 */
    private(set) var ItemMargin : CGFloat = 10.0
    /** 边缘间距 */
    private(set) var EdgeInsetsDefault : UIEdgeInsets = UIEdgeInsets.init(top:10,left:10,bottom:10,right:10)
       
    lazy var attrsArray :[UICollectionViewLayoutAttributes] = [UICollectionViewLayoutAttributes]()
    //存放所有列的当前高度
    lazy var columnHeightsAry = [CGFloat]()
    
    
    override init() {
        super.init()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /* 初始化一些信息和属性*/
    override func prepare() {
        super.prepare()
        columnHeightsAry.removeAll()
        for _ in 0..<ColumnCountDefault {

            columnHeightsAry.append(EdgeInsetsDefault.top)
        }
        attrsArray.removeAll()
        
        let sections : Int = (self.collectionView?.numberOfSections)!
        for section in 0..<sections {
            let count:Int = (self.collectionView?.numberOfItems(inSection: section))!
            for row in 0..<count {
                let indexpath : NSIndexPath = NSIndexPath.init(row: row, section: section)
                let attrs = self.layoutAttributesForItem(at: indexpath as IndexPath)
                attrsArray.append(attrs)
            }
        }
    }
    
    override func  layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes{
    
        let attrs = UICollectionViewLayoutAttributes.init(forCellWith: indexPath)
        let collectionWidth : CGFloat = (self.collectionView?.frame.size.width)!
        
        let width = (collectionWidth - EdgeInsetsDefault.left - CGFloat(ColumnCountDefault - 1) * ColumnMargin ) / CGFloat(ColumnCountDefault)
        let height = 100 + arc4random_uniform(100)
        
        var dextColum : Int = 0
        var mainH = columnHeightsAry[0]
        for i in 1 ..< ColumnCountDefault {
            let columnH = columnHeightsAry[i]
            if mainH > columnH {
                mainH = columnH
                dextColum = i
            }
            
        }
        
        let x = EdgeInsetsDefault.left + CGFloat(dextColum) * (width + ColumnMargin)
        var y = mainH
        if y != EdgeInsetsDefault.top {
            y = y + ItemMargin
        }
        
        attrs.frame = CGRect.init(x:CGFloat(x), y: CGFloat(y), width: CGFloat(width), height: CGFloat(height))
        columnHeightsAry[dextColum] = attrs.frame.maxY
        
        return attrs
    }
    
    override var collectionViewContentSize: CGSize {
        var maxheigt = columnHeightsAry[0]
        for i in 0 ..< ColumnCountDefault{
            let columnHeight = columnHeightsAry[i]
            if maxheigt < columnHeight {
                maxheigt = columnHeight
            }
        }
        return CGSize.init(width: 0, height: maxheigt + EdgeInsetsDefault.bottom)
    }
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attrsArray
    }
    
}
