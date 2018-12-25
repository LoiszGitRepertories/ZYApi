//
//  ZYApiReformer.swift
//  Api
//
//  Created by 赵建宇 on 2018/12/21.
//  Copyright © 2018 赵建宇. All rights reserved.
// 

import UIKit

public protocol ZYApiReformer: AnyObject {

    func reform(apiManager: ZYApiBaseManager) -> Any?
}
