//
//  ListController.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/8.
//  https://liumh.com/2018/09/18/design-pattern-strategy/

import Foundation

class ListController {

    private var dataSource: DataSource?

    //选择不同的算法策略
    func update(dataSource: DataSource) {
        self.dataSource = dataSource
    }

    //读取模型时 根据传入的策略类型 使用不同的数据读取方式
    func displayModels() {
        guard let dataSource = dataSource else { return }
        let models = dataSource.loadModles() as [StrategyUser]
        print("\n ListController: Displaying models...")
        models.forEach{ print($0) }
    }
}
