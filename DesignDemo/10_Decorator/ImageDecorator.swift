//
//  ImageDecorator.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/21.
//  装饰器

import Foundation
// 装饰基类：装饰基类和其他组件遵循相同的接口，主要任务是定义所有具体装饰的封装接口
class ImageDecorator: ImageEditor {
    
    // 保存被封装组件的成员变量
    private var editor: ImageEditor
    
    required init(_ editor: ImageEditor){
        self.editor = editor
    }
    
    func apply() -> UIImage {
        print(editor.description + "applies changes")
        return editor.apply()
    }
    
    var description: String {
        return "ImageDecorator"
    }
}
