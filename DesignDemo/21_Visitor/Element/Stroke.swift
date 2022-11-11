//
//  Stroke.swift
//  DesignDemo
//
//  线条（元素集合），包含了若干的Vertex子节点

import Foundation

class Stroke: Mark {
    
    var childern: [Mark] = [Mark]()
    
    override var lastChild: Mark? {
        get{
            guard let child = childern.last else { return nil }
            return child
        }
    }
    
    override var location: CGPoint? {
        set{
            self.location = newValue
        }
        get{
            if childern.count > 0 {
                let child = childern.last
                return child?.location ?? CGPoint.zero
            }
            return CGPoint.zero
        }
    }
    
    override func addMark(mark: Mark) {
        childern.append(mark)
    }
    
    override func removeMark(mark: Mark) {
        if let index: Int = childern.firstIndex(where: { $0 == mark}) {
            childern.remove(at: index)
        }
    }
    
    override func acceptMarkVisitor(visitor: MarkVisitor) {
        childern.forEach {
            $0.acceptMarkVisitor(visitor: visitor)
        }
        visitor.visitStroke(stroke: self)
    }
    
}
