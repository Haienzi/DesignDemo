//
//  Leaf.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/2.
//

import Foundation

class Leaf: NSObject, Components {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func add(component: NSObject&Components) {
        print("Can not add a Leaf")
    }
    
    func remove(component: NSObject&Components) {
        print("Can not remove from a leaf")
    }
    
    func display(depth: Int) {
        print("\(depth) Level \(name)")
    }
    
    
}
