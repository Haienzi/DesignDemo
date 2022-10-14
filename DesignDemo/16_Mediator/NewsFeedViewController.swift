//
//  NewsFeedViewController.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/7.
//  新闻列表组件对象，新闻列表，点赞和取消点赞行为会对所有列表对象进行修改
//  实现自己的业务，通过持有的中介者对象与其他同事组件通信
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
        // for var item 对item相关属性进行修改
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
        print("News Feed: User LIKED all news models")
        print("News Feed: I am telling to mediator about it...\n")
        newsArray.forEach({ mediator?.likeAdded(to: $0) })
    }

    func userDislikedAllNews() {
        print("News Feed: User DISLIKED all news models")
        print("News Feed: I am telling to mediator about it...\n")
        newsArray.forEach({ mediator?.likeRemoved(from: $0) })
    }
}
