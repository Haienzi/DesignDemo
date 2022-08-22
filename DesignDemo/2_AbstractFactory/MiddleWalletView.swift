//
//  MiddleWalletView.swift
//  DesignDemo
//
//  Created by mqh on 2022/7/28.
//

import Foundation
import UIKit

public class MiddleWalletView: MiddleView {
    public override func middleViewDidAppear() {
        print("middleViewDidAppear")
    }
    
    public override func middleViewDidDisappear() {
        print("middleViewDidDisappear")
    }
    
    public override func reloadDataWithModel() {
        print("reloadDataWithModel")
    }
}

