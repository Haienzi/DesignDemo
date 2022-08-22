//
//  Observer.swift
//  DesignDemo
//
//  Created by mqh on 2022/8/10.
//

import Foundation

// 限定类型的协议 表示只有引用类型可以实现该类协议
protocol Observer: AnyObject {
    
    func notify(subject: Subject)
}
