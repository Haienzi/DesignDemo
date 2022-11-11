//
//  Mark.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/9.
//  抽象元素，定义接受访问者的方法

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
    
    //接收访问者，每个元素都可以被访问者访问
    func acceptMarkVisitor(visitor: MarkVisitor){
        
    }
}

extension Mark: Equatable {
    static func == (lhs: Mark, rhs: Mark) -> Bool {
        return lhs.size == rhs.size && lhs.location == rhs.location
    }
    
}
