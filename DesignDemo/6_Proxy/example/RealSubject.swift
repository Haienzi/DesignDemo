//
//  RealSubject.swift
//  DesignDemo
//
//  Created by mqh on 2022/8/17.
// 

import Foundation

class RealSubject {
    var delegate: SubjectProtocol?
    var level = 0
    
    func levelUp(){
        print("call proxyObject to do something....")
        delegate?.sendHelpFor(object: self)
    }
}
