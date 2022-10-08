//
//  DoorOperation.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/29.
//

import Foundation

class DoorOperation: DelayedOperation {
    override func main() {
        print("\(self): Doors are closed via HomeKit")
    }
    
    override var description: String {
        return "DoorOperation"
    }
}
