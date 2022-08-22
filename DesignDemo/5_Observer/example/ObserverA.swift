//
//  ObserverA.swift
//  DesignDemo
//
//  Created by mqh on 2022/8/10.
//

import Foundation

class ObserverA: Observer {
    
    private var name: String = ""
    
    init(name: String) {
        self.name = name
    }
    
    func notify(subject: Subject) {
        if subject.state > 20 {
            print("观察者\(name)已被通知\n")
        }
    }
    
}
