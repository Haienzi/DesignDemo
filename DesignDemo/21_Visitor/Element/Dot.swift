//
//  Dot.swift
//  DesignDemo
//
//  具体元素：孤立的圆点不具有添加和删除子节点的功能。

import Foundation
class Dot: Mark {
    
    override func addMark(mark: Mark) {

    }
    
    override func removeMark(mark: Mark) {

    }
    
    //接受访问者方法的具体实现，使用访问者提供的访问该元素类的方法
    override func acceptMarkVisitor(visitor: MarkVisitor) {
        visitor.visitDot(dot: self)
    }
    
}
