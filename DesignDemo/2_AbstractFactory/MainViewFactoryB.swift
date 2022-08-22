//
//  MainMiddleViewFactory.swift
//  DesignDemo
//
//  Created by mqh on 2022/7/28.
//  个人中心视图集合

import Foundation
import UIKit

class MainViewFactoryB: ViewAbstractFactory {
    
    func newTopView() -> TopView {
        print(NSStringFromClass(type(of: self)) + " create TopLoginView")
        return TopLoginView()
    }
    
    func newMiddleView() -> MiddleView {
        print(NSStringFromClass(type(of: self)) + " create MiddleWalletView")
        return MiddleWalletView()
    }
}
