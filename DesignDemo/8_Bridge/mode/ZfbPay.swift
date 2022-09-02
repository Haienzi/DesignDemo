//
//  zfbPay.swift
//  DesignDemo
//
//  Created by mqh on 2022/8/31.
//

import Foundation

public class ZfbPay: Pay {
    var amount: Double = 200.0

    public override init(payMode: PayModeProtocol){
        super.init(payMode: payMode)
    }
    
    public override func transfer(id: String, tradeId: String, amount: Double) -> Bool {
        print("模拟支付宝划账开始********")
        let security = payMode?.security(id: id) ?? false
        if !security {
            print("环境不安全, 支付宝划账拦截")
            return false
        }
        self.amount += amount * 0.99
        print("支付宝划账成功********")
        return true
    }
}
