//
//  SquirreHandler.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/28.
//

import Foundation

class BaseHandler: Handler {
    var next: Handler?
    
    init(with handler: Handler? = nil) {
        self.next = handler
    }
    
    func handle(with request: Request) -> LocalizedError? {
        return next?.handle(with: request)
    }
}
