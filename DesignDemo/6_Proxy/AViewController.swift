//
//  File.swift
//  DesignDemo
//
//  Created by mqh on 2022/8/17.
//

import Foundation
import UIKit


class MyViewController: UIViewController {
    
    var data: [String] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.addSubview(tableView)
        return tableView
    }()
    
    override func viewDidLoad() {
        setData()
        //设置UITableView的代理
        let tableviewDelegate = TableViewDelegate(data: self.data)
        tableView.dataSource = tableviewDelegate
        tableView.delegate = tableviewDelegate
    }
    
    func setData(){
        for i in 0 ... 20 {
            data.append("单元格数据\(i)")
        }
    }
}

