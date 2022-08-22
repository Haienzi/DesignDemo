//
//  Proxy.swift
//  DesignDemo
//
//  Created by mqh on 2022/8/17.
//  代理对象

import Foundation

class ProxyObject: SubjectProtocol {
    var level = 3
    
    init(){
        
    }
    
    func sendHelpFor(object: RealSubject) {
        object.level = level
    }
}

class Client {
    func testProxy(){
        let xiaoming = RealSubject.init()
        let daming = ProxyObject.init()
        xiaoming.delegate = daming
        xiaoming.levelUp()
    }

}
