//
//  Subject.swift
//  DesignDemo
//
//  Created by mqh on 2022/8/10.
//

import Foundation

class Subject {
    var observers: [Observer] = []
    
    lazy var state: Int = {
        return Int(arc4random_uniform(100))
    }()
    
    func addObserver(observer: Observer) -> Void {
        observers.append(observer)
        print("Subject: 添加了一个观察者\(observer).\n")
    }
    
    func deleteObserver(observer: Observer) -> Void {
        if let index: Int = observers.firstIndex(where: {$0 === observer}) {
            observers.remove(at: index)
            print("Subject: 删除了一个观察者\(observer).\n")
        }
        
    }
    
    func notifyAll() -> Void {
        observers.forEach { observer in
            observer.notify(subject: self)
        }
        print("Subject: 通知所有观察者")
    }
    
    //通常 订阅逻辑可能只是Subject真正可以做的一小部分
    //主体通常有一些重要的业务逻辑，只要有重要事情发生（或之后）就会触发通知
    func someBussinessLogic() {
        print("Subject: 正在执行一些业务逻辑.\n")
        state = Int(arc4random_uniform(100))
        print("Subject: 我的状态已经改变:(\(state).\n")
        notifyAll()
    }
    
    
}
