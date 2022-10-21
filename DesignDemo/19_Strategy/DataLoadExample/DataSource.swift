//
//  DataSource.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/8.
//

import Foundation

protocol DomaindModel {
    var id: Int { get }
}

//定义读取数据方式的通用接口
protocol DataSource {
    func loadModles<T: DomaindModel>() -> [T]
}

// User数据结构
struct StrategyUser: DomaindModel {
    var id: Int
    var userName: String
}
