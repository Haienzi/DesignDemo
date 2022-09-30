//
//  Request.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/29.
//

import Foundation

protocol Request {
    var userName: String? { get }
    var email: String? { get }
    var password: String? { get }
    var repeatedPassword: String? { get }
}

//添加Request协议的默认实现
extension Request {
    var userName: String? { return nil }
    var email: String? { return nil }
    var password: String? { return nil }
    var repeatedPassword: String? { return nil }
}

struct SignUpRequest: Request {
    var userName: String?
    var email: String?
    var password: String?
    var repeatedPassword: String?
}

struct LoginRequest: Request {
    var email: String?
    var password: String?
}
