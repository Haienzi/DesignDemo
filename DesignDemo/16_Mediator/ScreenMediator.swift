//
//  ScreenMediator.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/7.
//

import Foundation

protocol ScreenUpdatable: AnyObject {
    func likeAdded(to news: News)
    
    func likeRemoved(from news: News)
}

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
