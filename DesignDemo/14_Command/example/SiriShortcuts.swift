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
    //OperationQueue相当于接收者，负责执行具体的命令
    private lazy var queue = OperationQueue()
    
    private init(){}
    
    //定义命令
    enum Action: String {
        case leaveHome
        case leaveWork
    }
    
    //接受命令相关的参数，创建具体的命令对象，将命令传递给OperationQueue来执行
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
    
    //取消命令
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
            //是否是同一类型的对象
            return type(of: operation) == operationType
        }.forEach( {$0.cancel()} )
    }
    
   
    private func add(operation: Operation) {
        queue.addOperation(operation)
    }
}
