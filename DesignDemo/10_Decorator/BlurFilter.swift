//
//  BlurFilter.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/21.
//

import Foundation

// 模糊滤镜
class BlurFilter: BaseFilterDecorator {
    
    required init(_ editor: ImageEditor) {
        super.init(editor: editor, filterName: "CIGaussianBlur")
    }
    
    func update(redius: Double) {
        filter?.setValue(redius, forKey: "inputRadius")
    }
    
    override var description: String {
        return "BlurFilter"
    }
}
