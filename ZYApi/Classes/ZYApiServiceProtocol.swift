//
//  ZYApiServiceProtocol.swift
//  Api
//
//  Created by 赵建宇 on 2018/12/20.
//  Copyright © 2018 赵建宇. All rights reserved.
// 全局配置； 请求封装； 通用错误处理

import Alamofire

public protocol ZYApiServiceProtocol: AnyObject {

    static var instance: ZYApiServiceProtocol { get }
    //为了根据不同开发人员开发的接口，需要将SessionManager的startRequestsImmediately属性设置为false
    var sessionManager : SessionManager { get }
    var apiEnvironment: ZYApiEnvironment { get }
    var baseServerAddress: String { get }
    var httpHeaders: HTTPHeaders { get }
    //针对不同人开发的接口 进行处理  [参数的封装拼接、加密]
    func request(params: ZYParam?, methodName: String, requestType: HTTPMethod) -> DataRequest
    func handleCommonError(_ apiManager: ZYApiBaseManager) -> Bool
}
