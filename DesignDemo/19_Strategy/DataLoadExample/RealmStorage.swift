//
//  RealmStorage.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/8.
//  具体读取方式3 Realm读取

import Foundation

class RealmStorage: DataSource {
    
    func loadModles<T>() -> [T] where T : DomaindModel {
        guard T.self == StrategyUser.self else { return [] }

        let user5 = StrategyUser(id: 5, userName: "RealmStorage")
        let user6 = StrategyUser(id: 6, userName: "TestRealm")

        return [user5, user6] as! [T]
    }
}
