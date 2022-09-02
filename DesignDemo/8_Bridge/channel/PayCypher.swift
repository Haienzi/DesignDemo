//
//  PayCypher.swift
//  DesignDemo
//
//  Created by mqh on 2022/8/31.
//

import Foundation

class PayCyper: PayModeProtocol {
    
    public func security(id: String) -> Bool {
        print("密码支付，密码支付环境验证")
        return true
    }
}
