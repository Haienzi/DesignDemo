//
//  MyNotificationCenter.swift
//  DesignDemo
//
//  Created by mqh on 2022/8/10.
//  调度通知的作用:Subject向通知中心发送通知，由通知中心进行统一管理， 

import Foundation
class MyNotificationCenter {
    static let singleton = MyNotificationCenter()
    private var center:[String: MySubject] = [:]
    
    private init(){
        
    }
    
    //注册通知：通知中心为selector添加Observer
    func addMyObserver(aObserver:AnyObject, aSelector:Selector, notificationName:String, subjectName:String) -> Void {
        let notification = MyNotification(observer: aObserver, selector: aSelector, name: notificationName)
        if let subject = center[subjectName] {
            subject.addMyObserver(myObserver: notification)
        } else {
            let subject = MySubject(observers: [notification])
            center[subjectName] = subject
        }
    }
    
    //移除通知:从通知中心移除对应Subject的Observer
    func removeMyObserver(observer: AnyObject, subjectName:String) -> Void {
        guard let subject = center[subjectName]  else { return }
        subject.removeMyObserver(observer: observer)
    }
    
    //发送通知
    func postNotification(subjectName: String) -> Void {
        guard let subject = center[subjectName]  else { return }
        subject.postNotification()
    }
    
    //发送通知
    func postNotification(notification: MyNotification, subjectName: String) -> Void {
        guard let subject = center[subjectName]  else { return }
        subject.postNotification(notification: notification)
    }
    
    //发送通知
    func postNotification(name: String?, object: AnyObject?, subjectName: String, userInfo: [AnyHashable : Any]?) {
        guard let subject = center[subjectName]  else { return }
        subject.postNotification(name: name, object: object, userInfo: userInfo)
    }
    
}
