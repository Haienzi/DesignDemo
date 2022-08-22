//
//  CellFactory.swift
//  DesignDemo
//
//  Created by mqh on 2022/7/25.
//  工厂方法模式
//  1、在父类中提供一个创建对象的方法，允许子类决定实例化对象的类型
//  2、定义一个创建对象的接口，让子类自己决定实例化哪一个工厂类，使创建过程延迟到子类进行
//  模仿首页卡片的生成：
//  通过MainPageCellFactory来按照数据类型初始化不同的卡片，每一种卡片的具体处理在本类中进行实现。

import Foundation
import UIKit

protocol RegisterMapFlagProtocol {
     var registerMapFlag: [String:Bool] { set get }
}

class MainPageCellFactory{

    var storeStr: String
    
    //存储卡片类型和对应的类名
    private lazy var cellMapping: [String: String] = {
        let cellMap = ["MainPageJobType":"MainPageJobCell",
                       "MainPageCarType":"MainPageCarCell",
                       "MainPageHouseType":"MainPageHouseCell"]
        return cellMap
    }()
    
    //单例
    static let cellFactory = MainPageCellFactory()
    
    private init(){
        storeStr = "单例无参数初始化"
    }
    
    //根据数据类型 获取不同Class的cell
    private func getCell(withCellData cellData: MainPageCellModel, withCollectionView collectionView: UICollectionView&RegisterMapFlagProtocol , withIndexPath indexPath: IndexPath) -> MainPageCell {
        guard let cellType = cellData.type, cellType != "" else {
            return  MainPageCell()
        }
        let className = cellMapping[cellType] ?? ""
        //1. 获取cell对应的class
        guard let cellClass = className.classFromString(withClassName: className ) as? MainPageCell.Type else {
            return  MainPageCell()
        }
        //2. 判断是否注册过，没有注册过，如果是xib实现的则通过xib方式注册，否则使用纯代码的方式注册
        let isRegistered = collectionView.registerMapFlag[cellType] ?? false
        if isRegistered {
            let cellInstance = cellClass.init()
            let hasXib = cellInstance.hasXib()
            if hasXib {
                let nib = UINib.init(nibName: className, bundle: .main)
                collectionView.register(nib, forCellWithReuseIdentifier: className)
            }else{
                collectionView.register(cellClass.self, forCellWithReuseIdentifier: className)
            }
            
        }
        //3. 从缓存队列中获取对应Cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: className, for: indexPath)  as! MainPageCell
        return cell
    }
    
}
