//
//  MyInvoker.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/6.
//

import Foundation

class MyInvoker {
    static let shared = MyInvoker()
    private lazy var queue = [CommandProtocol]()
    
    //定义命令
    enum Action: String {
        case enlarge
        case reduce
    }
    
    //添加并执行命令
    func addAndExecute(command: CommandProtocol){
        queue.append(command)
        command.execute()
    }
    
    //取消命令
    func cancel(action: Action){
        switch action {
        case .enlarge:
            cancelOperation(operationType: EnlargeCommand.self)
        case .reduce:
            cancelOperation(operationType: ReduceCommand.self)
        }
    }
    
    private func cancelOperation(operationType: CommandProtocol.Type){
        queue.filter { operation in
            return type(of: operation) == operationType
        }.forEach( {$0.cancel()} )
    }
    
}
