//
//  reduceCommand.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/6.
//

import Foundation

class ReduceCommand: CommandProtocol {
    var receiver: MyReceiver
    
    var parameter: CGFloat
    
    init(receiver: MyReceiver, parameter: CGFloat){
        self.receiver = receiver
        self.parameter = parameter
    }
    
    func execute() {
        receiver.reduceView(size: parameter)
    }
    
    func cancel() {
        receiver.enLargeView(size: parameter)
    }
    
}
