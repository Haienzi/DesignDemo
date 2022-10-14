//
//  ScreenMediator.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/7.
//

import Foundation

//抽象中介者，定义各个组件需要交互的方法
protocol ScreenUpdatable: AnyObject {
    func likeAdded(to news: News)
    
    func likeRemoved(from news: News)
}

//具体中介者，维护各个同事对象，负责具体的协调各同事对象的交互关系
class ScreenMediator: ScreenUpdatable {

    private var screens: [ScreenUpdatable]?

    func update(_ screens: [ScreenUpdatable]) {
        self.screens = screens
    }

    func likeAdded(to news: News) {
        print("Screen Mediator: Received a liked news model with id \(news.id)")
        screens?.forEach({ $0.likeAdded(to: news) })
    }

    func likeRemoved(from news: News) {
        print("ScreenMediator: Received a disliked news model with id \(news.id)")
        screens?.forEach({ $0.likeRemoved(from: news) })
    }
}
