//
//  CoreDataStorage.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/8.
//

import Foundation

class CoreDataStorage: DataSource {
    func loadModles<T>() -> [T] where T : DomaindModel {
        guard T.self == User.self else { return [] }

        let user3 = StrategyUser(id: 3, userName: "CoreDataStorage")
        let user4 = StrategyUser(id: 4, userName: "TestCoreData")

        return [user3, user4] as! [T]
    }
}
