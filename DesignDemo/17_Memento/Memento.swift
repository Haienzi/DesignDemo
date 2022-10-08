//
//  Memento.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/8.
//  备忘录

import Foundation

protocol Memento: CustomStringConvertible {
    
    var text: String { get }
    var date: Date { get }
}
