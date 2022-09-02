//
//  PayFingerprintMode.swift
//  DesignDemo
//
//  Created by mqh on 2022/8/31.
//

import Foundation

class PayFingerPrintMode: PayModeProtocol {
    
    public func security(id: String) -> Bool {
        print("指纹支付，指纹信息验证")
        return true
    }
    
}
