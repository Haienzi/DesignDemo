//
//  SiriShortcuts.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/29.
//

import Foundation

//invoker 命令调用者
class SiriShortcuts {
    static let shared = SiriShortcuts()
    private lazy var queue = OperationQueue()
    
    private init(){}
    
    //定义命令
    enum Action: String {
        case leaveHome
        case leaveWork
    }
    
    func perform(_ action: Action, delay: TimeInterval = 0){
        print("Siri: perform \(action)-action\n")
        switch action {
        case .leaveHome:
            add(operation: WindowOperation(delay))
            add(operation: DoorOperation(delay))
        case .leaveWork:
            add(operation: TaxiOperation(delay))
        }
    }
    
    func cancel(action: Action){
        print("Siri: canceling \(action) - action\n")
        switch action {
        case .leaveHome:
            cancelOperation(operationType: WindowOperation.self)
            cancelOperation(operationType: DoorOperation.self)
        case .leaveWork:
            cancelOperation(operationType: TaxiOperation.self)
        }
    }
    
    private func cancelOperation(operationType: Operation.Type){
        queue.operations.filter { operation in
            return type(of: operation) == operationType
        }.forEach( {$0.cancel()} )
    }
    
    private func add(operation: Operation) {
        queue.addOperation(operation)
    }
}
