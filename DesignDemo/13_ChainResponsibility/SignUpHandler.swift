//
//  DogHandler.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/28.
//

import Foundation

// 注册处理类
class SignUpHandler: BaseHandler {
    
    private struct Limit {
        static let passwordLength = 8
    }
    
    override func handle(with request: Request) -> LocalizedError? {
        //邮箱限定
        guard request.email?.contains("@") == true else {
            return AuthError.invalidEmail
        }
        
        //密码限定大于8位
        guard (request.password?.count ?? 0) > Limit.passwordLength else {
            return AuthError.invalidPassword
        }
        
        //确认密码
        guard request.password == request.repeatedPassword else {
            return AuthError.differentPasswords
        }
        
        //进入下一个流程
        return next?.handle(with: request)
    }

    
}
