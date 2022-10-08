//
//  EnlargeCommand.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/6.
//

import Foundation

class EnlargeCommand: CommandProtocol {
    var receiver: MyReceiver
    
    var parameter: CGFloat
    
    init(receiver: MyReceiver, parameter: CGFloat){
        self.receiver = receiver
        self.parameter = parameter
    }
    
    func execute() {
        receiver.enLargeView(size: parameter)
    }
    
    func cancel() {
        receiver.reduceView(size: parameter)
    }
    
}
