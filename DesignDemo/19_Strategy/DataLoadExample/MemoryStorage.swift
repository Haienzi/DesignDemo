//
//  MemoryStorage.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/8.
//  具体读取方式1 Memory

import Foundation

class MemonryStorage: DataSource {
    
    private lazy var items = [DomaindModel]()
    
    func loadModles<T>() -> [T] where T: DomaindModel {
        guard T.self == StrategyUser.self else
        {
            return []
        }
        
        return items as! [T]
    }
    
    func add(items: [DomaindModel]){
        self.items.append(contentsOf: items)
    }
    
}
