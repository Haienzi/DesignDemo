//
//  BlueBuffDecorator.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/15.
//

import Foundation

class BlueBuffDecorator: BufferDecorator {
    
    override func blessBuff() {
        super.blessBuff()
        print("BlueBuff: 蓝量回复速度加快，并且缩减技能恢复时间")
    }
}
