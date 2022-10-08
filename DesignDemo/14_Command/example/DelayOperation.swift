//
//  DelayOperation.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/29.
//

import Foundation

// Operation协议：https://juejin.cn/post/6844904109737246728
// 命令Command
class DelayedOperation: Operation {
    private var delay: TimeInterval
    private var _executing: Bool = false
    private var _finished: Bool = false
    
    init(_ delay: TimeInterval = 0) {
        self.delay = delay
    }
    
    override var isExecuting: Bool {
        get { return _executing }
        set {
            willChangeValue(forKey: "isExecuting")
            _executing = newValue
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    override var isFinished: Bool {
        get { return _finished }
        set {
            willChangeValue(forKey: "isFinished")
            _finished = newValue
            didChangeValue(forKey: "isFinished")
        }
    }
    //start和main方法的区别：main方法执行完毕，整个operation会从队列中被移除
    override func start() {
        guard delay > 0 else {
            _start()
            return
        }
        
        let deadline = DispatchTime.now() + delay
        DispatchQueue(label: "").asyncAfter(deadline: deadline) {
            self._start()
        }
    }
    
    private func _start() {
        guard !self.isCancelled else {
            print("\(self): operation is canceled")
            self.isFinished = true
            return
        }
        
        self.isExecuting = true
        self.main()
        self.isExecuting = false
        self.isFinished = true
    }
    
}
