//
//  MarkVisitor.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/9.
//  访问者对象，定义对每一个元素访问的行为，方法的参数是可以访问的元素，方法个数理论上和元素个数一致

import Foundation

protocol MarkVisitor {
    
    func visitMark(mark: Mark)
    
    func visitVertex(vertex: Vertex)
    
    func visitDot(dot: Dot)
    
    func visitStroke(stroke: Stroke)
}
