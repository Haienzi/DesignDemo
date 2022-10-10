//
//  Dot.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/9.
//  点，实心圆，在屏幕上代表一个点

import Foundation

class Dot: Mark {
    
    override func addMark(mark: Mark) {

    }
    
    override func removeMark(mark: Mark) {

    }
    
    override func acceptMarkVisitor(visitor: MarkVisitor) {
        visitor.visitDot(dot: self)
    }
    
}
