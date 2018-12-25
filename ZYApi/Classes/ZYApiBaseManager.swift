//
//  ZYApiBaseManager.swift
//  Api
//
//  Created by 赵建宇 on 2018/12/20.
//  Copyright © 2018 赵建宇. All rights reserved.
// 离散型Api的父类

import Alamofire
import SwiftyJSON

open class ZYApiBaseManager: NSObject{

    public weak var inheritor: ZYApiBaseManagerInHerator? = nil //继承者需要实现的协议
    public weak var paramSource: ZYApiParamsSource? = nil //参数
    public weak var delegate: ZYApiCallBackDelegate? = nil //成功失败的回调
    
    public var response : DefaultDataResponse? = nil
    public var request : DataRequest? = nil
    
    public var isLoading : Bool = false //是否加载中
    
    override init() {
        super.init()
        if self is ZYApiBaseManagerInHerator{
            inheritor = self as? ZYApiBaseManagerInHerator
        }else{
            assert(true, "子类必须遵循ZYApiBaseManagerInHerator协议")
        }
        if self is ZYApiParamsSource{
            paramSource = self as? ZYApiParamsSource
        }
    }
    
    public convenience init(callback: ZYApiCallBackDelegate){
        self.init()
        delegate = callback
    }
}

