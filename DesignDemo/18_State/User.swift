//
//  User.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/8.
//

import Foundation

class User {
    var money: Double = 0
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
        state.handle()
    }
    
}
