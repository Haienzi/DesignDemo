//
//  CellFactory.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/26.
//  享元工厂：决定是否复用已有的享元对象或者创建一个新的对象

import Foundation

class AppearanceFactory {
    
    private static var cache = [CellType: Appearance]()
     
    static func appearence(for key: CellType) -> Appearance {
        guard cache[key] == nil else {
            print("AppearenceFactory: Reusing an existing\(key.rawValue)-appearence.")
            return cache[key]!
        }
        print("AppearenceFactory: Can't find a cached \(key.rawValue), creating a new one.")
        switch key{
            case .ImageTextCell:
                    cache[key] = imageTextAppearance
            case .TextCell:
                    cache[key] = textAppearance
            case .SingleImageCell:
                    cache[key] = singleImageAppearance
        }
        return cache[key]!
    }
}

extension AppearanceFactory {
    // 具体享元外观状态
    private static var imageTextAppearance: Appearance {
        return Appearance(rowIndex: 1, imageName: "ImageTextAppearance", text: "FlyWeight Exe- ImageTextAppearance")
    }
    
    private static var singleImageAppearance: Appearance {
        return Appearance(rowIndex: 2, imageName: "ImageAppearance", text: "FlyWeight Exe- ImageAppearance")
    }
    
    private static var textAppearance: Appearance {
        return Appearance(rowIndex: 3, imageName: "TextAppearance", text: "FlyWeight Exe- TextAppearance")
    }
}

