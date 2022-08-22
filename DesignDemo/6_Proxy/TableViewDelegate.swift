//
//  TableViewDelegate.swift
//  DesignDemo
//
//  Created by mqh on 2022/8/17.
//  通过代理设计模式的思想，将UITableView的数据操作交给一个代理对象去实现，减少使用时控制器的代码量
//

import Foundation
import UIKit

class TableViewDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    var data: [String]?
    let identifier: String = "TableViewProxy"
    
    init(data: [String]?) {
        self.data = data
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = data?[indexPath.row]
        cell.backgroundColor = (indexPath.row % 2 == 0) ? .lightGray : .white
        cell.textLabel?.textColor = (indexPath.row % 2 == 0) ? .red : .cyan
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了\(indexPath)")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
