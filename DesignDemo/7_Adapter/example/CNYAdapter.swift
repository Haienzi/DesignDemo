//
//  CNYAdapter.swift
//  DesignDemo
//
//  Created by mqh on 2022/8/26.
//

import Foundation

// 对象适配器模式
class CNYObejctAdapter: TargetProtocol {
    
    var usdObject: USDAdaptee?
    init(usdObject: USDAdaptee){
        self.usdObject = usdObject
    }
    
    func getCNY() -> Double {
        return (usdObject?.usd ?? 0) * 6.8
    }
}

//类适配器模式
class CNYAdapter: USDAdaptee, TargetProtocol {
    
    func getCNY() -> Double {
        return usd * 6.8
    }
}
