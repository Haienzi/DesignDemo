//
//  Mark.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/9.
//  抽象元素，标志，线条和点的父类

import Foundation

class Mark {
    var location: CGPoint?
    var size: CGFloat?
    var lastChild: Mark? {
        get{
            return nil
        }
    }

    func addMark(mark: Mark){
        
    }
    
    func removeMark(mark: Mark){
        
    }
    
    func acceptMarkVisitor(visitor: MarkVisitor){
        
    }
}

extension Mark: Equatable {
    static func == (lhs: Mark, rhs: Mark) -> Bool {
        return lhs.size == rhs.size && lhs.location == rhs.location
    }
    
}
