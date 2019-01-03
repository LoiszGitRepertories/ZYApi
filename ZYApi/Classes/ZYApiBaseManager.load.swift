//
//  ZYApiBaseManager.load.swift
//  Api
//
//  Created by 赵建宇 on 2018/12/21.
//  Copyright © 2018 赵建宇. All rights reserved.
//

import Alamofire
import SwiftyJSON

extension ZYApiBaseManager{
    
    public func load(){
        //得到参数和孩子
        let params = paramSource?.params(for: self)
        guard let _inheritor = inheritor else { return }
        request = _inheritor.service.request(params: params, methodName: _inheritor.methodName, requestType: _inheritor.requestType)
     
        if let _request = request?.request{
            print(_request.logString(apiName: _inheritor.methodName, service: _inheritor.service))
        }

        isLoading = true
        
        //判断网络状态
        if let isReachable = NetworkReachabilityManager()?.isReachable,  isReachable{
            //实现reponse方法，此时方法不会执行
            request!.response { (response) in
                self.response = response
                self.isLoading = false
                
                //guard _inheritor.service.handleCommonError(self) else { return }
                
                print(response.logString())
                
                if let tempError = response.error{
                    var errorType = ZYApiError.ZYApiErrorDefault
                    if tempError.code == NSURLErrorTimedOut {
                        errorType = ZYApiError.ZYApiErrorTimeout
                    }
                    if tempError.code == NSURLErrorCancelled {
                        errorType = ZYApiError.ZYApiErrorCancel
                    }
                    if tempError.code == NSURLErrorNotConnectedToInternet {
                        errorType = ZYApiError.ZYApiErrorNoNetWork // 默认除了超时以外的错误都是无网络错误。
                    }
                    self.failOnCalling(errorType: errorType)
                }else{
                    self.successOnCalling()
                }
            }
            request!.resume()
        }else{
            failOnCalling(errorType: .ZYApiErrorNoNetWork)
        }
        // ....
    }
    
    
    //成功 只要有数据返回  底层就是成功的
    fileprivate func successOnCalling(){
        guard let _inheritor = inheritor else { return }
        if _inheritor.service.handleCommonError(self){
            delegate?.requestSuccess(self)
        }else{
            failOnCalling(errorType: .ZYApiErrorCommon)
        }
        
    }
    
    //失败 除了commonError都是网络异常
    fileprivate func failOnCalling(errorType: ZYApiError){
        delegate?.requestFailure(self, errorType)
    }
}


