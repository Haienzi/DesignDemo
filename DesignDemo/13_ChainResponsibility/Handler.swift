//
//  Handler.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/28.
//

import Foundation
import UIKit

//1. 可以扩展协议提供需要的实现， extension里面写协议方法的默认实现
//2. 添加额外的功能给遵循的类型所使用 extension where限定协议类型
protocol Handler {
    
    var next: Handler? { get } //处理者
    
    func handle(with request: Request) -> LocalizedError? //处理请求
    
}

//定义详细的错误信息
enum AuthError: LocalizedError {
    case emptyUserName
    case emptyEmail
    case emptyPassword
    case invalidEmail
    case invalidPassword
    case differentPasswords
    
    case locationDisabled
    case notificationDisabled
    
    var errorDescription: String? {
        switch self {
        case .emptyUserName:
            return " Username is empty"
        case .emptyEmail:
            return "Email is empty"
        case .emptyPassword:
            return "Password is empty"
        case .invalidEmail:
            return "Email is invalid"
        case .invalidPassword:
            return "Password is invalid"
        case .differentPasswords:
            return "Password and repeated passeord should be same"
        case .locationDisabled:
            return "Please turn location services on"
        case .notificationDisabled:
            return "Please turn notification services on"
        }
    }
    
    
}

