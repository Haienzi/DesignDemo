//
//  Vertex.swift
//  DesignDemo
//
//  顶点 线条中的一个顶点，不具有添加和删除子节点的功能

import Foundation

class Vertex: Mark {
    
    override func addMark(mark: Mark) {

    }
    
    override func removeMark(mark: Mark) {

    }
    //调用访问者的visit方法，将自己作为参数传递
    override func acceptMarkVisitor(visitor: MarkVisitor) {
        visitor.visitVertex(vertex: self)
    }
    
}
