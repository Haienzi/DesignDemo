//
//  DefaultLabelTheme.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/22.
//

import Foundation

protocol LabelTheme: Theme {
    var textColor: UIColor { get }
}

struct DefaultLabelTheme: LabelTheme {
    
    var textColor: UIColor = UIColor.black
    
    var backgroundColor: UIColor = UIColor.white
    
    var description: String { return "Default Label Theme" }
    
}

struct NightLabelTheme: LabelTheme {
    
    var textColor: UIColor = UIColor.white
    
    var backgroundColor: UIColor = UIColor.black
    
    var description: String { return "Night Label Theme" }
    
}
