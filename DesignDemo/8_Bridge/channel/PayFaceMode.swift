//
//  PayFaceMode.swift
//  DesignDemo
//
//  Created by mqh on 2022/8/31.
//  人脸支付

import Foundation

class PayFaceMode: PayModeProtocol {
    
    public func security(id: String) -> Bool {
        print("人脸支付，脸部识别")
        return true
    }
}
