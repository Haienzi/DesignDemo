//
//  News.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/7.
//

import Foundation

struct News: Equatable {
    let id: Int
    let title: String
    var likesCount: Int
    
    static func == (left: News, right: News) -> Bool {
        return left.id == right.id
    }
}
