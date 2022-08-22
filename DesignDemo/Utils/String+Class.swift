//
//  String+Class.swift
//  DesignDemo
//
//  Created by mqh on 2022/7/26.
//  swift字符串转化为类

import Foundation

extension String {
    //从字符串获取对应的类
    func classFromString(withClassName className: String) -> AnyClass? {
        //1. 获取命名空间
        var name = Bundle.main.object(forInfoDictionaryKey: "CFBundleExecutable") as? String
        //2. 如果包名中有'-'横线这样的字符，在拿到包名后，还需要把包名的'-'转换成'_'下横线
        name = name?.replacingOccurrences(of: "-", with: "_")
        //3. 组合命名空间和类名 命令空间.类名
        let fullClassName = name ?? "" + "." + className
        //4. 通过NSClassFormString获得最终的类
        let anyClass: AnyClass? = NSClassFromString(fullClassName)
        return anyClass
    }
}


