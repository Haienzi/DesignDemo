//
//  Vertex.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/9.
//  顶点 连接起来的一串顶点，被绘制成链接起来的线条

import Foundation

class Vertex: Mark {
    
    override func addMark(mark: Mark) {

    }
    
    override func removeMark(mark: Mark) {

    }
    
    override func acceptMarkVisitor(visitor: MarkVisitor) {
        visitor.visitVertex(vertex: self)
    }
    
}
