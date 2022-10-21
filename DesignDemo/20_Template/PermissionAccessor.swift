//
//  File.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/19.
//  请求权限抽象类，定义了请求权限时的基本算法步骤

import Foundation

class PermissionAccessor: CustomStringConvertible {

    typealias Completion = (Bool) -> ()
    
    //定义了请求权限时的基本算法步骤 @escaping 逃逸函数
    func requestAccessIfNeeded(_ completion: @escaping Completion){
        //判断是否有权限
        guard !hasAccess() else {
            completion(true)
            return
        }
        
        willReceiveAccess()
        requestAccess { status in
            status ? self.didReceiveAccess() : self.didRejectAccess()
            completion(status)
        }
    }
    
    //钩子方法 请求权限
    func requestAccess(_ completion: @escaping Completion) {
        fatalError("Should be overridden")
    }
    
    //判断是否有权限
    func hasAccess() -> Bool {
        fatalError("Should be overridden")
    }
    
    //将要申请权限前的操作
    func willReceiveAccess(){}
    
    //授权
    func didReceiveAccess(){}
    
    //拒绝授权
    func didRejectAccess(){}
    
    var description: String {
        return "PermissionAccessor"
    }
}
