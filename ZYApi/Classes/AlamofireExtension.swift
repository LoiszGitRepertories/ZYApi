//
//  AlamofireExtension.swift
//  Api
//
//  Created by 赵建宇 on 2018/12/21.
//  Copyright © 2018 赵建宇. All rights reserved.
// 日志

import Alamofire

extension URLRequest {
    public func logString(apiName:String, service: ZYApiServiceProtocol) -> String {
        
        var logString = "\n\n***********************\nRequest Start\n***********************\n\n"
        
        var environmentString = ""
        switch service.apiEnvironment {
        case .test:
            environmentString = "Develop"
        case .release:
            environmentString = "Release"
        }
        
        logString += "Environment:\t\(environmentString)\n"
        logString += "API Name:\t\t\(apiName)\n"
        logString += "Method:\t\t\t\(httpMethod ?? "N/A")\n"
        logString += "Service:\t\t\(type(of: service))\n"
        logString += descriptionLogString()
        
        logString += "\n\n***********************\nRequest End\n***********************\n\n"
        
        return logString
    }
    
    func descriptionLogString() -> String {
        var result = ""
        
        result += "\n\nHTTP URL:\n\t\(url?.absoluteString ?? "N/A")"
        
        var headerString = ""
        if let httpHeaders = allHTTPHeaderFields {
            result += "\n\nHTTP Header:"
            
            httpHeaders.forEach { (key, value) in
                result += "\n\t\(key):\(value)"
                headerString += " -H \"\(key):\(value)\""
            }
        }
        
        var bodyString = ""
        if let bodyData = httpBody {
            if let _bodyString = String(data: bodyData, encoding: .utf8) {
                bodyString += " -d \'\(_bodyString)\'"
            }
            result += "\n\nHTTP Body:\n\t\(bodyString)"
        }
        
        result += "\n\nCURL:\n\t curl -X \(httpMethod ?? "Get")\(headerString)\(bodyString) \(url?.absoluteString ?? "")"
        
        return result
    }
    
    func dictionaryToJsonString(dictionary:[AnyHashable:Any]) -> String {
        guard let data = try? JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted) else { return "" }
        let result = String(data: data, encoding: .utf8) ?? ""
        return result
    }
}



extension DefaultDataResponse {
    public func logString() -> String {
        
        guard let response = response else { return "No Response" }
        guard let request = request else { return "No Request" }
        
        var logString = "\n\n=========================================\nAPI Response\n=========================================\n\n"
        logString += "Status:\t\(response.statusCode)\t\(HTTPURLResponse.localizedString(forStatusCode: response.statusCode))\n\n"
        
        if let data = data {
            logString += "Content:\n\t\(String(data: data, encoding: .utf8) ?? "Can not parse response data")\n\n"
        } else {
            logString += "Content:\n\tNo Data Available\n\n"
        }
        
        if let error = error {
            logString += error.localizedDescription
        }
        
        logString += "\n---------------  Related Request Content  --------------\n"
        logString += request.descriptionLogString()
        logString += "\n\n=========================================\nResponse End\n=========================================\n\n"
        return logString
    }
}


extension Error {
    var code: Int { return (self as NSError).code }
    var domain: String { return (self as NSError).domain }
}
