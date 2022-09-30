//
//  CellType.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/26.
//

import Foundation

//享元对象：包括原始对象中部分能够在多个对象中共享的状态
enum CellType: String {
    case SingleImageCell
    case ImageTextCell
    case TextCell
}

//原始对象：包括内部状态和外部状态
class Cell {
    let type: CellType //内部状态
    var appearence: Appearance { //外部状态
        return AppearanceFactory.appearence(for: type)
    }
    
    init(type: CellType){
        self.type = type
    }
}

//存储外在状态
struct Appearance {
    let rowIndex: Int
    let imageName: String
    let text: String
}
