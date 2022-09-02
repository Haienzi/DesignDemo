//
//  Components.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/2.
//  定义公共的接口

import Foundation

public protocol Components {
    
    var name: String { get set }
    
    func add(component: NSObject&Components)
    
    func remove(component: NSObject&Components)
    
    func display(depth: Int)
}
