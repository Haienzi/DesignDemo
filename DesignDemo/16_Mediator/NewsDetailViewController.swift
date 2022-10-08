//
//  NewsDetailViewController.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/7.
//

import Foundation

class NewsDetailViewController: ScreenUpdatable {

    private var news: News
    private weak var mediator: ScreenUpdatable?

    init(_ mediator: ScreenUpdatable?, _ news: News) {
        self.news = news
        self.mediator = mediator
    }

    func likeAdded(to news: News) {
        print("News Detail: Received a liked news model with id \(news.id)")
        if self.news == news {
            self.news.likesCount += 1
        }
    }

    func likeRemoved(from news: News) {
        print("News Detail: Received a disliked news model with id \(news.id)")
        if self.news == news {
            self.news.likesCount -= 1
        }
    }
}
