//
//  MainPageJobCell.swift
//  DesignDemo
//
//  Created by mqh on 2022/7/26.
//  工作卡片

import Foundation
import UIKit

class MainPageJobCell: MainPageCell {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
   
    override func getCellHeight(data: Any) -> Float {
        return  model?.height ?? 0
    }
    
    override func configCell(data: Any) {
        super.configCell(data: data)
    }
    
    override func hasXib() -> Bool {
        return false
    }
}

