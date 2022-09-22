//
//  Resizer.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/21.
//
// convenience关键字和required关键字

import Foundation
import UIKit

//图片大小调整装饰子类
class ResizerDecorator: ImageDecorator {
    private var xScale: CGFloat = 0
    private var yScale: CGFloat = 0
    private var hasAlpha = false
    
    //convenience关键字：增加init的初始化方法，不能被子类重写或者是从子类中以super的方式被调用
    // 只有在子类中实现重写了父类convenience方法所需要的init方法的话，在子类中就可以使用父类的
    // convenience初始化方法
    convenience init(_ editor: ImageEditor, xScale: CGFloat = 0, yScale: CGFloat = 0, hasAlpha: Bool = false){
        self.init(editor)
        self.xScale = xScale
        self.yScale = yScale
        self.hasAlpha = hasAlpha
    }
    
    required init(_ editor: ImageEditor) {
        super.init(editor)
    }

    override func apply() -> UIImage {
        let image = super.apply()
        //调整图片的大小
        let size = image.size.applying(CGAffineTransform(scaleX: xScale, y: yScale))
        
        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, UIScreen.main.scale)
        image.draw(in: CGRect(origin: .zero, size: size))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage ?? image
        
    }
    
    override var description: String {
        return "Resizer"
    }

    
}
