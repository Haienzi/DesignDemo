//
//  User.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/8.
//  拥有多种状态的对象

import Foundation

class User {
    var money: Double = 0
    
    //获取状态
    var state: MemberState {
        get{
            if money < 100 {
                return NormalMemberState()
            } else if money < 1000 {
                return GoldMemberState()
            }else if money < 10000 {
                return PlatinumMemberState()
            }else{
                return DiamondMemberState()
            }
        }
    }
    
    init(_ money: Double){
        self.money = money
    }
    
    //调用状态对应的业务方法
    func doSomething(){
        //功能判断不需要再使用复杂的if-else来判断状态在调用方法
        state.handle()
    }
    
}
