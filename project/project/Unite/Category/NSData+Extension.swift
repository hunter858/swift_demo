//
//  NSData+Extension.swift
//  project
//
//  Created by edz on 2020/1/7.
//  Copyright © 2020 edz. All rights reserved.
//

import Foundation



extension Data{
    
    /* Data translate Model */
    func toModel<T:Codable>(modelType :T.Type) ->T?{
        do {
            return try JSONDecoder().decode(modelType, from: self)
            
        }catch{
            /* j*/
            debugPrint(error.localizedDescription)
            return nil
        }
    }
    
    /* Data translate NSDictionary */
    func toDictionary() -> Dictionary<String,Any>?{
        /*mutableContainers */
        if let dic = try?JSONSerialization.jsonObject(with: self, options: .mutableContainers){
            if let result = dic as? Dictionary<String,Any>{
                return result
            }
        }
        return nil
    }
    
    /* Data translate Array */
    func toArray() ->Array<Any>?{
        if let array = try?JSONSerialization.jsonObject(with: self, options: .mutableContainers){
            if let result = array as? Array<Any>{
                return result
            }
        }
        return nil
    }
    /* Data translate String */
    func toString() ->String?{
        if let string = try? String.init(data: self, encoding: .utf8){
            return string
        }
        return nil
    }
}
