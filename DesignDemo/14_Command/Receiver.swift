//
//  Receiver.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/6.
//  请求接收者，负责根据参数执行和取消具体的命令

import Foundation

class MyReceiver {
    var width: CGFloat = 0
    var view: UIView //正方形
    
    struct Constant{
        public static let centerX = UIScreen.main.bounds.width/2
        public static let centerY = UIScreen.main.bounds.height/2
        public static let MaxWidth = 20.0
    }
    
    init(view: UIView){
        self.view = view
    }
    
    func enLargeView(size: CGFloat) {
        width += size
        width = min(width, Constant.centerX)
        view.frame = CGRect(x: Constant.centerX-width/2, y: Constant.centerY-width/2, width: width, height: width)
    }
    
    func reduceView(size: CGFloat){
        width -= size
        width = max(width, Constant.MaxWidth)
        view.frame = CGRect(x: Constant.centerX-width/2, y: Constant.centerY-width/2, width: width, height: width)
    }
}
