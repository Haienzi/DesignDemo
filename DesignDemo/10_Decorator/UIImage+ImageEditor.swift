//
//  UIImage+ImageEditor.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/21.
//

import Foundation

extension UIImage: ImageEditor{
    
    func apply() -> UIImage {
        return self
    }
    
    open override var description: String {
        return "Image"
    }
    
}
