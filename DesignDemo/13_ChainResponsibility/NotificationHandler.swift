//
//  NotificationHandler.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/29.
//

import Foundation

//通知是否可用
class NotificationHandler: BaseHandler {
    
    override func handle(with request: Request) -> LocalizedError? {
        guard isNotificationEnabled() else {
            return AuthError.notificationDisabled
        }
        return next?.handle(with: request)
    }
    
    func isNotificationEnabled() -> Bool {
        return false
    }
    
}
