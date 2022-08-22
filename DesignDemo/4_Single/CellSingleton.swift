//
//  CellFactorySingleton.swift
//  DesignDemo
//
//  Created by mqh on 2022/7/25.
//  单例模式
//

import Foundation

//1、 使用全局变量来实现单例模式 swift全局变量默认使用dispatch_once
//let cellShared = CellSingleton()

class CellSingleton{
    //2、使用static
    public static let cellShared = CellSingleton()
    
    //3、单例在闭包中初始化，同时使用类方法来获取单例
    private static let cellSharedBlock: CellSingleton = {
        let shared = CellSingleton()
        
        return shared
    }()

    //构造方法私有！
    private init(){
        
    }
    
    class func shared() -> CellSingleton {
        return cellSharedBlock
    }
    
    
}
