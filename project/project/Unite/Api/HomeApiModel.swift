//
//  HomeApiModel.swift
//  project
//
//  Created by edz on 2020/1/7.
//  Copyright © 2020 edz. All rights reserved.
//

import Foundation

struct HomeModelItem: Codable{
    var positionId:Int?
    var versionNo:String?
}

struct HomeModel :Codable{
    var topCarousel:HomeModelItem?
    var middleNavigation:HomeModelItem?
    var timeLimit:HomeModelItem?
    var preferential:HomeModelItem?
    var tab:HomeModelItem?
    var activitygif:HomeModelItem?
    var recommend:HomeModelItem?
}

struct LandingPageModel :Codable{
    var home: HomeModel?
    var isUIWebView :String?
    var isLife :String?
}

struct HomeApiModel :Codable {
   var landingPage: LandingPageModel?
}
