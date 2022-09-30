//
//  LocationHandler.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/29.
//

import Foundation

//地理位置是否可用
class LocationHandler: BaseHandler {
    
    override func handle(with request: Request) -> LocalizedError? {
        guard isLocationEnabled() else {
            return AuthError.locationDisabled
        }
        return next?.handle(with: request)
    }
    
    func isLocationEnabled() -> Bool {
        return true
    }
}

