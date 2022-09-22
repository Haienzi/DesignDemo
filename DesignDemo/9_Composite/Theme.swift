//
//  Theme.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/22.
//

import Foundation

//定义主题类型
protocol Theme: CustomStringConvertible {
    var backgroundColor: UIColor { get }
}
