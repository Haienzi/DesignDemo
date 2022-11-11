//
//  VisitorTestViewController.swift
//  DesignDemo
//
//

import Foundation

class VisitorTestViewController: ViewController {
    
    var parentMark: Mark?
    var startPoint: CGPoint = CGPoint.zero
    
    private lazy var canvasView: CanvasView = {
        let view = CanvasView()
        view.backgroundColor = .blue
        view.frame = self.view.frame
        return view
    }()
    
    override func viewDidLoad() {
        parentMark = Stroke()
        view.addSubview(canvasView)
    }
    
    func addMark(mark: Mark, shouldAddToPreviousMark: Bool){
        if shouldAddToPreviousMark {
            parentMark?.lastChild?.addMark(mark: mark)
        } else{
            parentMark?.addMark(mark: mark)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        startPoint = touch.location(in: canvasView)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let lastPoint = touch.previousLocation(in: canvasView)
        if __CGPointEqualToPoint(lastPoint, startPoint){
            let newStroke = Stroke()
            addMark(mark: newStroke, shouldAddToPreviousMark: false)
        }
        
        let currentPoint = touch.location(in: canvasView)
        let vertex = Vertex()
        vertex.location = currentPoint
        addMark(mark: vertex, shouldAddToPreviousMark: true)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let lastPoint = touch.previousLocation(in: canvasView)
        let currentPoint = touch.location(in: canvasView)
        if __CGPointEqualToPoint(lastPoint, currentPoint){
            let dot = Dot()
            dot.location = currentPoint
            addMark(mark: dot, shouldAddToPreviousMark: false)
        }
        startPoint = CGPoint.zero
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        startPoint = CGPoint.zero
    }
}
