//
//  Pay.swift
//  DesignDemo
//
//  Created by mqh on 2022/8/31.
//

import Foundation

public class Pay {
    var payMode: PayModeProtocol?
    
    public init(payMode: PayModeProtocol){
        self.payMode = payMode
    }
    
    //交易
    public func transfer(id: String, tradeId: String, amount: Double) -> Bool {
        return false
    }
}
