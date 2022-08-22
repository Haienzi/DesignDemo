//
//  MainCategoryFactory.swift
//  DesignDemo
//
//  Created by mqh on 2022/7/28.
//

import Foundation
import UIKit

public protocol MiddleViewProtocol {
    
    func middleViewDidAppear()
    
    func middleViewDidDisappear()
    
    func reloadDataWithModel()
}

public class MiddleView:UIView, MiddleViewProtocol {
    public func middleViewDidAppear() {
        
    }
    
    public func middleViewDidDisappear() {
        
    }
    
    public func reloadDataWithModel() {
        
    }
    
    
  
}
