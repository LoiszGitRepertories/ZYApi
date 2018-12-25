//
//  ZYApiCallBack.swift
//  Api
//
//  Created by 赵建宇 on 2018/12/20.
//  Copyright © 2018 赵建宇. All rights reserved.
//

import UIKit

public protocol ZYApiCallBackDelegate: AnyObject{
    
    func requestSuccess(_ apiManager: ZYApiBaseManager)
    
    func requestFailure(_ apiManager: ZYApiBaseManager, _ errorType: ZYApiError)
}
