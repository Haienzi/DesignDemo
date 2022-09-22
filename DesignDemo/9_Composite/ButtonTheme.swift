//
//  DefaultButtonTheme.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/22.
//

import Foundation

protocol ButtonTheme: Theme {
    var textColor: UIColor { get }
    var highlightedColor: UIColor { get }
}

struct DefaultButtonTheme: ButtonTheme {
    
    var textColor: UIColor = UIColor.blue
    
    var highlightedColor: UIColor = UIColor.red
    
    var backgroundColor: UIColor = UIColor.white
    
    var description: String { return "Default Button Theme" }
    
}

struct NightButtonTheme: ButtonTheme {
    
    var textColor: UIColor = UIColor.red
    
    var highlightedColor: UIColor = UIColor.systemPink
    
    var backgroundColor: UIColor = UIColor.black
    
    var description: String { return "Night Button Theme" }
   
}
