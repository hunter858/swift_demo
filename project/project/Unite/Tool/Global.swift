//
//  Global.swift
//  project
//
//  Created by edz on 2019/10/29.
//  Copyright © 2019 edz. All rights reserved.
//

import Foundation
import UIKit

public let BottomSafeInset : CGFloat = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0 ;

public let ScreenHeight = UIScreen.main.bounds.size.height
public let ScreenWidth = UIScreen.main.bounds.size.width
public let isIphoneX :Bool = (BottomSafeInset == 34.0 || BottomSafeInset == 21.0) ? true : false;
public let SafeTopHeight :CGFloat = isIphoneX ? 84 : 64 ;
public let SafeBottomHeight :CGFloat = isIphoneX ? 34 : 0 ;

