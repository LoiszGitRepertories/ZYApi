//
//  ZYApiBaseManager.Reformer.swift
//  Api
//
//  Created by 赵建宇 on 2018/12/21.
//  Copyright © 2018 赵建宇. All rights reserved.
//
import Alamofire
import SwiftyJSON

extension ZYApiBaseManager{
    
    public func fetch(reformer: ZYApiReformer?) -> Any? {
        guard let data = self.response?.data else { return nil }
        guard let reformer = reformer else {
            if let result = try? JSON(data: data) {
                return result
            } else if let result = String(data: data, encoding: .utf8) {
                return result
            } else {
                return data
            }
        }
        return reformer.reform(apiManager: self)
    }
    
    public func fetchAsData() -> Data? {
        return self.response?.data
    }
    
    public func fetchAsString() -> String? {
        guard let data = self.response?.data else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    public func fetchAsJSON() -> JSON? {
        guard let data = self.response?.data else { return nil }
        let result = try? JSON(data: data)
        return result
    }
}

