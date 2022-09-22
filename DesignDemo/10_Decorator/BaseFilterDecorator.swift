//
//  BaseFilter.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/21.
//

import Foundation

// 图片滤镜装饰子类
class BaseFilterDecorator: ImageDecorator {
    // CIFilter 滤镜类
    var filter: CIFilter?
    
    init(editor: ImageEditor, filterName: String){
        self.filter = CIFilter(name: filterName)
        super.init(editor)
    }
    
    required init(_ editor: ImageEditor) {
        super.init(editor)
    }
    
    override func apply() -> UIImage {
        let image = super.apply()
        let context = CIContext(options: nil)
        //滤镜处理image
        filter?.setValue(CIImage(image: image), forKey: kCIInputImageKey)
        
        guard let output = filter?.outputImage else { return image }
        //用CIContext将CIImage转换为CGImage
        guard let coreImage = context.createCGImage(output, from: output.extent) else {
            return image
        }
        return UIImage(cgImage: coreImage)
                
    }
    
    override var description: String {
        return "BaseFilter"
    }
}

