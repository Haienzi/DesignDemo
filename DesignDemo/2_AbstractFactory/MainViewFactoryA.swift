//
//  MainTopViewFactory.swift
//  DesignDemo
//
//  Created by mqh on 2022/7/28.
//  首页视图集合

import Foundation
import UIKit

class MainViewFactoryA: ViewAbstractFactory {
    
    
    func newTopView() -> TopView {
        print(" create TopSearchView")
        return TopSearchView()
    }
    
    func newMiddleView() -> MiddleView {
        print( " create MiddleCategoryView")
        return MiddleCategoryView()
    }
  
}
