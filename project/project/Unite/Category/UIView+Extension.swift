//
//  UIView+Extension.swift
//  project
//
//  Created by edz on 2019/11/7.
//  Copyright © 2019 edz. All rights reserved.
//

import UIKit

extension UIView {
    ///
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
            
        }
    }
    
    public var y: CGFloat {
           get {
               return self.frame.origin.y
           }
           set {
               var frame = self.frame
               frame.origin.y = newValue
               self.frame = frame
               
           }
       }
    public var width: CGFloat {
           get {
            return self.frame.size.width
           }
           set {
               var frame = self.frame
               frame.size.width = newValue
               self.frame = frame
               
           }
       }
    public var height: CGFloat {
           get {
               return self.frame.size.height
           }
           set {
               var frame = self.frame
               frame.size.height = newValue
               self.frame = frame
               
           }
       }
    
    public var centerX: CGFloat {
           get {
            return self.center.x
           }
           set {
               
            self.center = CGPoint(x: newValue, y: self.center.y)
               
           }
    }
    
    public var centerY: CGFloat {
            get {
                return self.center.y
            }
            set {
                self.center = CGPoint(x: self.center.x, y: newValue)
            }
    }
    
    
    /* 添加圆角*/
    func addCornerRadius(roundingCorners: UIRectCorner ,radius : CGFloat) -> Void {
        let size = CGSize(width: radius, height: radius)
        let rounderd = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: roundingCorners, cornerRadii: size)
        let shape = CAShapeLayer()
        shape.path = rounderd.cgPath
        self.layer.mask = shape
    }
    
    
    
}
