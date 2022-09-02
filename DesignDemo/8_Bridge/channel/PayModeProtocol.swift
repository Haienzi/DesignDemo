//
//  PayModeProtocol.swift
//  DesignDemo
//
//  Created by mqh on 2022/8/31.
//

import Foundation

public protocol PayModeProtocol {
    func security(id: String) -> Bool
    
}
