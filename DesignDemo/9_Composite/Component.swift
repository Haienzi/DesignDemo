//
//  Component.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/22.
//

import Foundation

//抽象构件：定义应用主题的协议规范
protocol Component {
    //叶子和容器需要统一遵循的方法 应用主题操作
    func accept<T: Theme>(theme: T)
}

extension UIView: Component {
}

extension UIViewController: Component {
}

extension UIButton {
    open override var description: String {
        return "UIButton"
    }
}

extension UILabel {
    open override var description: String {
        return "UILabel"
    }
}


//限制实现协议方法的类型为UIView
extension Component where Self: UIView {
    func accept<T: Theme>(theme: T) {
        print("\t\(description): has applied \(theme.description)")
        backgroundColor = theme.backgroundColor
    }
}

//限制实现协议方法的类型为UIViewController
extension Component where Self: UIViewController {
    //UIViewController中循环为子视图应用主题样式
    func accept<T: Theme>(theme: T) {
        view.accept(theme: theme)
        view.subviews.forEach {
            $0.accept(theme: theme)
        }
        print("\t\(description): has applied \(theme.description)")
    }
}

extension Component where Self: UILabel {
    
    func accept<T: LabelTheme>(theme: T) {
        print("\t\(description): has applied \(theme.description)")
        backgroundColor = theme.backgroundColor
        textColor = theme.textColor
    }
}

extension Component where Self: UIButton {
    
    func accept<T: ButtonTheme>(theme: T) {
        print("\t\(description): has applied \(theme.description)")
        backgroundColor = theme.backgroundColor
        setTitleColor(theme.textColor, for: .normal)
        setTitleColor(theme.highlightedColor, for: .highlighted)
    }
}
