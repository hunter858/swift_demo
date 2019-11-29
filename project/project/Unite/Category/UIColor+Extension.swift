//
//  UIColor+Extension.swift
//  project
//
//  Created by edz on 2019/11/7.
//  Copyright © 2019 edz. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat, a :CGFloat = 1.0) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    class var randomColor : UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)), a: CGFloat(arc4random_uniform(256)))
    }
    
    convenience init?(hexString: String) {
        
        // ## # 0x 0X
        // 1.判断字符串的长度是否大于等于7
        guard hexString.count >= 6 else {
            return nil
        }
        
        // 2.将字符串转成大写
        var hexTempString = hexString.uppercased()
        
        // 3.判断字符串是否是OXFF0022
        if hexTempString.hasPrefix("0X") || hexTempString.hasPrefix("##") {
            hexTempString = (hexTempString as NSString).substring(from: 2)
        }
        
        // 4.判断字符串是否是以#开头
        if hexTempString.hasPrefix("#") {
            hexTempString = (hexTempString as NSString).substring(from: 1)
        }
        
        // 5.获取RGB分别对应的十六进制
        var range = NSRange(location: 0, length: 2)
        
        let rHex = (hexTempString as NSString).substring(with: range)
        
        range.location = 2
        let gHex = (hexTempString as NSString).substring(with: range)
        
        range.location = 4
        let bHex = (hexTempString as NSString).substring(with: range)
        
        // 6.将十六进制转成数值
        var r: UInt32 = 0
        var g: UInt32 = 0
        var b: UInt32 = 0
        
        Scanner(string: rHex).scanHexInt32(&r)
        Scanner(string: gHex).scanHexInt32(&g)
        Scanner(string: bHex).scanHexInt32(&b)
        
        self.init(r: CGFloat(r), g: CGFloat(g), b: CGFloat(b))
        
    }
    
}


extension UIColor {
    class var defaultColor: UIColor {
        get{ return UIColor(hexString: "#55AEED")!}
    }
    
    class var NavigationBarColor : UIColor {
        get{ return UIColor(hexString: "#9BDA60")!}
    }
}
