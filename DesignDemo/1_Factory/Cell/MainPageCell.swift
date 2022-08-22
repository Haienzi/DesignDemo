//
//  MainPageCell.swift
//  DesignDemo
//  CellFactory根据不同的数据返回不同的cell
//  Created by mqh on 2022/7/26.
//

import Foundation
import UIKit

class MainPageCell: UICollectionViewCell {
    var model:MainPageCellModel?
    
    func configCell(data: Any) {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: .fragmentsAllowed) else { return }
        guard let cellModel = try? JSONDecoder().decode(MainPageCellModel.self, from: jsonData) else { return }
        model = cellModel
    }
    

    func getCellHeight(data: Any) -> Float {
        return model?.height ??  0
    }
    
    func hasXib() -> Bool {
        return false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



