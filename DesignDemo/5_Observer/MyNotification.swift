//
//  MyNotification.swift
//  DesignDemo
//
//  Created by mqh on 2022/8/10.
//
// Any、NSObject和AnyObject的区别
// Any：任何类型 基本类型，结构体、方法等
// AnyObject: 任何class类型的实例
// AnyHashable: Dictionary和Set需要的键类型要求遵守Hashable协议的类型

import Foundation

class MyNotification {
    let name: String? //发送通知的对象的名称
    let observer: AnyObject? //观察者对象
    let selector: Selector? //操作
    // let object: AnyObject?  即为subject
    var userInfo:[AnyHashable: Any]? //字典信息
    
    init(observer: AnyObject, selector: Selector, name: String) {
        self.name = name
        self.observer = observer
        self.selector = selector
    }
}

extension MyNotification: Equatable {
    //引用类型不能直接使用==进行比较 除非实现了Equatable协议
    static func == (lp: MyNotification, rp: MyNotification) -> Bool {
        return ((lp.name == rp.name) && (lp.selector == rp.selector) && (lp.observer === rp.observer))
    }
}
