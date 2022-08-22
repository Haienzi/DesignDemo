//
//  MainAbstractFactory.swift
//  DesignDemo
//
//  Created by mqh on 2022/7/28.
//  抽象工厂方法模式：工厂和产品都是抽象的，每个具体工厂负责一类产品的实现，可以随时切换到另一组工厂和产品
//  假设每一页的视图包括顶部、中腰
//  A工厂中的视图集合是：顶部搜索，中腰icon区
//  B工厂的的视图集合是：顶部登陆，中腰钱包

import Foundation
import UIKit

public protocol ViewAbstractFactory {
    
    //创建顶部视图
    func newTopView() -> TopView
    
    //创建中腰视图
    func newMiddleView() -> MiddleView
    
    
}
