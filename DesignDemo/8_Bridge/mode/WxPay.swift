//
//  WxPay.swift
//  DesignDemo
//
//  Created by mqh on 2022/8/31.
//

import Foundation

public class WxPay: Pay {
    var amount: Double = 10000.0
    
    public override init(payMode: PayModeProtocol){
        super.init(payMode: payMode)
    }
    
    public override func transfer(id: String, tradeId: String, amount: Double) -> Bool {
        print("模拟微信划账开始********")
        let security = payMode?.security(id: id) ?? false
        if !security {
            print("环境不安全, 微信划账拦截")
            return false
        }
        self.amount += amount * 0.98
        print("微信划账成功********")
        return true
    }
}
