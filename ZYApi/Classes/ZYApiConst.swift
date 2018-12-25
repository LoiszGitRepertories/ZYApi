//
//  ZYApiConst.swift
//  Api
//
//  Created by 赵建宇 on 2018/12/21.
//  Copyright © 2018 赵建宇. All rights reserved.
//

public typealias ZYParam = [String : Any]



public enum ZYApiEnvironment{
    case test
    case release
}


public enum ZYApiError{
    
    case ZYApiErrorDefault           // 没有产生过API请求，这个是manager的默认状态。
    case ZYApiErrorTimeout           //超时
    case ZYApiErrorNoNetWork         //无网络 除了超时以外，所有错误都当成是无网络
    case ZYApiErrorCancel            //请求取消
    
    
    //case ZYApiErrorNoError           //无错误
    //case ZYApiErrorNeedLogin         // 需要登陆
    //case ZYApiErrorNeedUpdateToken   // 需要重新刷新accessToken
    //case ZYApiErrorParmasError       //参数错误，此时manager不会调用API，因为参数验证是在调用API之前做的。
    
    func errorMsg() -> String{
        switch self {
        case .ZYApiErrorTimeout:
            return "请求超时"
        case .ZYApiErrorNoNetWork:
            return "无网络连接，请检查网络"
        case .ZYApiErrorCancel:
            return "请求取消"
        default:
            return ""
        }
    }
}
