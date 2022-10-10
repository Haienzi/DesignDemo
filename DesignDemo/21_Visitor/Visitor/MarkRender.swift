//
//  MarkRender.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/9.
//  具体的访问者 绘制访问者，对点和线进行绘制操作

import Foundation

class MarkRender: MarkVisitor {
    var context: CGContext
    var shouldMoveContextToDot: Bool = true
    
    init(context: CGContext){
        self.context = context
    }
    
    func visitMark(mark: Mark) {
    
    }
    
    func visitVertex(vertex: Vertex) {
        let x = vertex.location?.x ?? 0.0
        let y = vertex.location?.y ?? 0.0
        if shouldMoveContextToDot {
            context.move(to: CGPoint(x: x, y: y))
        } else {
            context.addLine(to: CGPoint(x: x, y: y))
        }
    }
    
    func visitDot(dot: Dot) {
        let x = dot.location?.x ?? 0.0
        let y = dot.location?.y ?? 0.0
        let frame = CGRect(x: x, y: y, width: 2, height: 2)
        context.setFillColor(UIColor.red.cgColor)
        context.fillEllipse(in: frame)
    }
    
    func visitStroke(stroke: Stroke) {
        context.setStrokeColor(UIColor.blue.cgColor)
        context.setLineWidth(1)
        context.setLineCap(CGLineCap.round)
        context.strokePath()
        shouldMoveContextToDot = true
        
    }
    
    
}
