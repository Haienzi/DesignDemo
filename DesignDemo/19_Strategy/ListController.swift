//
//  ListController.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/8.
//

import Foundation

class ListController {

    private var dataSource: DataSource?

    func update(dataSource: DataSource) {
        self.dataSource = dataSource
    }

    func displayModels() {

        guard let dataSource = dataSource else { return }
        let models = dataSource.loadModles() as [StrategyUser]

        print("\nListController: Displaying models...")
        models.forEach({ print($0) })
    }
}
