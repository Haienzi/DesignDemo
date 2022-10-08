//
//  NewsFeedViewController.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/7.
//

import Foundation

class NewsFeedViewController: ScreenUpdatable {

    private var newsArray: [News]
    private weak var mediator: ScreenUpdatable?

    init(_ mediator: ScreenUpdatable?, _ newsArray: [News]) {
        self.newsArray = newsArray
        self.mediator = mediator
    }

    func likeAdded(to news: News) {

        print("News Feed: Received a liked news model with id \(news.id)")

        for var item in newsArray {
            if item == news {
                item.likesCount += 1
            }
        }
    }

    func likeRemoved(from news: News) {

        print("News Feed: Received a disliked news model with id \(news.id)")

        for var item in newsArray {
            if item == news {
                item.likesCount -= 1
            }
        }
    }

    func userLikedAllNews() {
        print("\n\nNews Feed: User LIKED all news models")
        print("News Feed: I am telling to mediator about it...\n")
        newsArray.forEach({ mediator?.likeAdded(to: $0) })
    }

    func userDislikedAllNews() {
        print("\n\nNews Feed: User DISLIKED all news models")
        print("News Feed: I am telling to mediator about it...\n")
        newsArray.forEach({ mediator?.likeRemoved(from: $0) })
    }
}
