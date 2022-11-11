//
//  CanvasView.swift
//  DesignDemo
//
//

import Foundation

class CanvasView: UIView {
    private var mark: Mark?
    
    public func setMark(mark: Mark) {
        self.mark = mark
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return  }
        let markRender = MarkRender(context: context)
        self.mark?.acceptMarkVisitor(visitor: markRender)
    }

}
