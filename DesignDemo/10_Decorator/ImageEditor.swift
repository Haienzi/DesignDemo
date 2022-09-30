//
//  ImageEditor.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/21.
//  CustomStringConvertible:在调试时输出自定义的类和结构体时会打印出很多不想输出的变量，
//  可以通过实现该协议自定义输出的字符串形式


import Foundation

//封装对图片操作的公用接口
protocol ImageEditor: CustomStringConvertible {
    func apply() -> UIImage
}
