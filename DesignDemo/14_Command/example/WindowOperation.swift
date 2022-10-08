//
//  WindowOperation.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/29.
//

import Foundation
//具体命令 重写main接口
class WindowOperation: DelayedOperation {
    override func main() {
        print("\(self): Windows are closed via HomeKit.")
    }
    
    override var description: String {
        return "WindowOperation"
    }
}
