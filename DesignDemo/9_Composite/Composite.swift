//
//  Composite.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/2.
//

import Foundation

public class Composite: NSObject, Components {
    var childArr: [NSObject&Components] = []
    
    public var name: String
    
    init(name: String){
        self.name = name
    }
    
    public func add(component: NSObject&Components) {
        childArr.append(component)
        print("Composite add \(component) success!" )
    }
    
    public func remove(component: NSObject&Components) {
        if let index = childArr.firstIndex(where: {$0 === component}) {
            childArr.remove(at: index)
            print("Composite remove \(component) success!" )
        }
       
    }
    
    public func display(depth: Int) {
        print("\(depth) Level \(name)")
        childArr.forEach {
            $0.display(depth: depth+1)
        }
       
    }
    
}
