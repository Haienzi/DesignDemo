//
//  MarkVisitor.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/9.
//  访问者对象

import Foundation

protocol MarkVisitor {
    
    func visitMark(mark: Mark)
    
    func visitVertex(vertex: Vertex)
    
    func visitDot(dot: Dot)
    
    func visitStroke(stroke: Stroke)
}
