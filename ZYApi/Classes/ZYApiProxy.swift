//
//  ZYApiProxy.swift
//  Api
//
//  Created by 赵建宇 on 2018/12/24.
//  Copyright © 2018 赵建宇. All rights reserved.
//

//import Alamofire
//
//class ZYApiProxy {
//
//    static let instance = ZYApiProxy()
//}
//
//
////MARK: - load
//extension ZYApiProxy{
//    
//    func callApiWithRequest(request: URLRequest, success: @escaping (DefaultDataResponse)->(), fail: @escaping (ZYApiError)->()){
//        Alamofire.request(request).response { (response) in
//            if let tempError = response.error{
//                var errorType = ZYApiError.ZYApiErrorDefault
//                if tempError.code == NSURLErrorTimedOut {
//                    errorType = ZYApiError.ZYApiErrorTimeout
//                }
//                if tempError.code == NSURLErrorCancelled {
//                    errorType = ZYApiError.ZYApiErrorCancel
//                }
//                if tempError.code == NSURLErrorNotConnectedToInternet {
//                    errorType = ZYApiError.ZYApiErrorNoNetWork // 默认除了超时以外的错误都是无网络错误。
//                }
//                fail(errorType)
//            }else{
//                success(response)
//            }
//        }
//    }
//    
//    
//}
