//
//  MainContentViewFactory.swift
//  DesignDemo
//
//  Created by mqh on 2022/7/28.
//

import Foundation
import UIKit

public protocol TopViewProtocol {
    
    func topViewDidAppear()
    
    func topViewDidDisappear()
    
    func reloadDataWithModel()
    
}

public class TopView:UIView, TopViewProtocol {
    public func topViewDidAppear() {
        
    }
    
    public func topViewDidDisappear() {
        
    }
    
    public func reloadDataWithModel() {
        
    }
  
}
