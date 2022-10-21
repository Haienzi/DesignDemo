//
//  NormalMemberState.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/8.
//  具体状态类

import Foundation

class NormalMemberState: MemberState {
    func handle() {
        print("普通会员：购物不打折，提升会员等级享折扣哦！")
    }
}
