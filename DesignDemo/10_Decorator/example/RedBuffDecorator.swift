//
//  RedBuffDecorator.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/15.
//

import Foundation

class RedBuffDecorator: BufferDecorator {
    
    override func blessBuff() {
        super.blessBuff()
        print("RedBuff: 攻击增加附加伤害，并造成灼烧效果")
    }
}
