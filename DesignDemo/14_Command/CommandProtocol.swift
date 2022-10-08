//
//  CommandProtocol.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/6.
//

import Foundation

protocol CommandProtocol {
    var receiver: MyReceiver { get }
    var parameter: CGFloat { get}
    
    //执行命令
    func execute()
    //取消命令
    func cancel()
}
