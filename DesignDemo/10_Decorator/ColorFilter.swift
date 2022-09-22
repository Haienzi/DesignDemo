//
//  ColorFilter.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/21.
//

import Foundation

//颜色调整滤镜
class ColorFilter: BaseFilterDecorator {
    
    required init(_ editor: ImageEditor) {
        super.init(editor: editor, filterName: "CIColorControls")
    }
    
    //饱和度
    func update(saturation: Double){
        filter?.setValue(saturation, forKey: "inputSaturation")
    }
    
    //亮度
    func update(brightness: Double){
        filter?.setValue(brightness, forKey: "inputBrightness")
    }
    
    //对比度
    func update(contrast: Double){
        filter?.setValue(contrast, forKey: "inputContrast")
    }
    
    override var description: String {
        return "ColorFilter"
    }
}
