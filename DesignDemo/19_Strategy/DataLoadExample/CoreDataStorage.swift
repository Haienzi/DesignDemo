//
//  CoreDataStorage.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/8.
//  具体读取方式2 CoreData读取

import Foundation

class CoreDataStorage: DataSource {
    
    func loadModles<T>() -> [T] where T : DomaindModel {
        guard T.self == StrategyUser.self else { return [] }

        let user3 = StrategyUser(id: 3, userName: "31415926@qq.com")
        let user4 = StrategyUser(id: 4, userName: "62952413@qq.com")

        return [user3, user4] as! [T]
    }
}
