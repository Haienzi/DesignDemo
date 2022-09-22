//
//  BufferDecorator.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/15.
//

import Foundation
import UIKit

class BufferDecorator: Hero {
    
    var hero: Hero?
    
    init(hero: Hero){
        self.hero = hero
    }
    
    func blessBuff() {
        hero?.blessBuff()
        print("额外buff: ")
    }
    
}
