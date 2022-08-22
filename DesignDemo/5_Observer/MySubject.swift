//
//  MySubject.swift
//  DesignDemo
//
//  Created by mqh on 2022/8/10.
//  subject向通知中心发送通知

import Foundation


class MySubject {
    var observers: [MyNotification] = []
    
    init(observers: [MyNotification]) {
        self.observers = observers
        observers.forEach {
            print("MySubject: 添加了观察者\($0.name ?? "").\n")
        }

    }
    
    //添加观察者
    func addMyObserver(myObserver: MyNotification) -> Void {
        //先判断，不存在再添加
        let hasObserver = observers.contains(myObserver)
        if !hasObserver {
            observers.append(myObserver)
            print("MySubject: 添加了观察者\(myObserver.name ?? "").\n")
        }
    }
    
    //删除观察者
    func removeMyObserver(observer: AnyObject) -> Void {
        if let index = observers.firstIndex(where: {$0.observer === observer}) {
            observers.remove(at: index)
            print("MySubject: 删除了观察者\(observer).\n")
        }
    }
    
    //给所有观察者发送通知
    func postNotification(){
        observers.forEach {
            //performSelector
            performNotification(notification: $0)
        }
        print("MySubject: 给所有观察者发送通知\n")
    }
    
    //发送通知
    func postNotification(notification: MyNotification){
        postNotification(name: notification.name, object: notification.observer, userInfo: notification.userInfo)
    }
    
    //发布通知
    func postNotification(name: String?, object: AnyObject?, userInfo: [AnyHashable:Any]?) {
        // 1. notificationName为nil， 通知中心会通知所有与该通知中object相匹配的监听对象
        if name == nil && object != nil {
            let filters = observers.filter { $0.observer === object!}
            filters.forEach{
                $0.userInfo = userInfo
                performNotification(notification: $0)
            }
            print("MySubject:notificationName为nil，通知所有与该通知中object相匹配的监听对象\(object!)\n")
        }
        // 2. object为nil，通知中心会通知所有与该通知中notificationName相匹配的监听对象
        if object == nil && name != nil {
            let filters = observers.filter { $0.name == name!}
            filters.forEach{
                $0.userInfo = userInfo
                performNotification(notification: $0)
            }
            print("MySubject:object为nil，通知所有与该通知中notificationName相匹配的监听对象\(name ?? "")\n")
        }
        // 3. object和name均不为nil
        if let notificationName = name, let observerObject = object {
            if let index = observers.firstIndex(where: {($0.name ==  notificationName) && ($0.observer === observerObject)}) {
                let notification = observers[index]
                notification.userInfo = userInfo
                performNotification(notification: notification)
                print("MySubject:通知notificationName为\(notificationName)且object对象为\(observerObject)\n")
            }
        }
        
    }

    private func performNotification(notification: MyNotification) -> Void {
        if let observer = notification.observer, let selector = notification.selector  {
            observer.perform(selector, with: notification.userInfo, afterDelay: 0)
        }
    }

}
