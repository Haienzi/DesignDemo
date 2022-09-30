//
//  MonkeyHandler.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/28.
//

import Foundation
import Metal

//登录处理：判断邮箱和密码
class LoginHandler: BaseHandler {
    
    override func handle(with request: Request) -> LocalizedError? {
        guard request.email?.isEmpty == false else {
            return AuthError.emptyEmail
        }
        
        guard request.password?.isEmpty == false else {
            return AuthError.emptyPassword
        }
        
        return next?.handle(with: request)
    }
}
