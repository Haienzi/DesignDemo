//
//  Memento.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/8.
//  备忘录：存储原发器的内部状态，在需要的时候将状态提供给负责人

import Foundation

protocol Memento: CustomStringConvertible {
    
    var text: String { get }
    var date: Date { get }
}
