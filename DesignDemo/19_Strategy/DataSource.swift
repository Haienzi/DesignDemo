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

protocol DataSource {
    func loadModles<T: DomaindModel>() -> [T]
}

struct StrategyUser: DomaindModel {
    var id: Int
    var userName: String

}
