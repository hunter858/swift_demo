//
//  HomeApi.swift
//  project
//
//  Created by edz on 2019/10/29.
//  Copyright © 2019 edz. All rights reserved.
//

import Moya
import Alamofire

/* */
let HomeProvider  = MoyaProvider<SpringTourApi>()

/* 定义URL 分类*/
public enum SpringTourApi {
    case app
    case router
    case getVersion
}

extension SpringTourApi: TargetType {
    public var task: Task {
        switch self {
        case .app:
            return .requestPlain
        case .router:
            return .requestParameters(parameters: ["startCityId":"61",
                                                   "cityId":"0",
                                                   "orderFrom":"2",
                                                   "positionId":"234",
                                                   "springsign":"DB20EF73AC52C07246CA175FD046E720F94CAE43",
                                                   "appBuildNo":"304"], encoding: JSONEncoding.default)
            
        case.getVersion:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
         return ["Content-Type":"application/json"]
    }
    
    
    
    public  var baseURL: URL{
          return URL.init(string: "http://m.springtour.com")!
      }
          
    public  var path: String{
       
          switch self {
          case .app:
              return "/app/router"
          case .router:
              return "/m/app/queryContent"
          case .getVersion:
              return "/m/app/getversion"
          }
    }
       
    public  var method: Moya.Method {
          switch self {
          case .app:
              return .get
          case .router:
              return .post
          case .getVersion:
              return .get
          }
    }
          
    public  var sampleData: Data {
          return "单元测试数据".data(using: String.Encoding.utf8)!
    }
          
}
