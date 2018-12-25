//
//  ZYApiBaseManagerInHeratorInHeritor.swift
//  Api
//
//  Created by 赵建宇 on 2018/12/20.
//  Copyright © 2018 赵建宇. All rights reserved.
//

import Alamofire

public protocol ZYApiBaseManagerInHerator: AnyObject {

    var service: ZYApiServiceProtocol { get set }
    var methodName: String { get }
    var requestType : HTTPMethod { get }
}
