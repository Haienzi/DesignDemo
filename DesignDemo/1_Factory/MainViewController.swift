//
//  MainCollectionViewController.swift
//  DesignDemo
//
//  Created by mqh on 2022/7/27.
//

import Foundation
import UIKit

class MyCollectionView:UICollectionView, RegisterMapFlagProtocol {
    private struct AssociatedKey {
        static var registerMapFlag:[String: Bool] = [:]
    }
    
    @objc public var registerMapFlag: [String: Bool] {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.registerMapFlag) as? [String: Bool] ?? [:]
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.registerMapFlag, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

//extension UICollectionView: RegisterMapFlagProtocol {
////    var registerMapFlag: [String : Bool] {
////        set {
////
////        }
////        get{
////            return [:]
////        }
////    }
//    //swift extension 增加存储类型属性
//    private struct AssociatedKey {
//        static var registerMapFlag:[String: Bool] = [:]
//    }
//
//    public var registerMapFlag: [String: Bool] {
//        get {
//            return objc_getAssociatedObject(self, &AssociatedKey.registerMapFlag) as? [String: Bool] ?? [:]
//        }
//        set {
//            objc_setAssociatedObject(self, &AssociatedKey.registerMapFlag, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
//}


class MainViewController: UIViewController {
    private struct Constant {
        static let collectionWidth = UIScreen.main.bounds.width
        static let collectionHeight = UIScreen.main.bounds.height
        static let collectionCellHeight = 100.0
    }
    
    public var model: [MainPageCellModel]?
    
    public lazy var mainCollectionView: MyCollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize.init(width: Constant.collectionWidth, height: Constant.collectionCellHeight)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = .zero
        let collectionFrame = CGRect.init(x: 0, y: 10, width: Constant.collectionWidth, height:Constant.collectionHeight)
        let view = MyCollectionView.init(frame: collectionFrame, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.isScrollEnabled = false
        view.isUserInteractionEnabled = true
        if #available(iOS 11.0, *) {
            view.contentInsetAdjustmentBehavior = .never;
        }
        return view
    }()
    
//    public lazy var mainCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout.init()
//        layout.scrollDirection = .vertical
//        layout.itemSize = CGSize.init(width: Constant.collectionWidth, height: Constant.collectionCellHeight)
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
//        layout.sectionInset = .zero
//        let collectionFrame = CGRect.init(x: 0, y: 10, width: Constant.collectionWidth, height:Constant.collectionHeight)
//        let view = UICollectionView.init(frame: collectionFrame, collectionViewLayout: layout)
//        view.delegate = self
//        view.dataSource = self
//        view.isScrollEnabled = false
//        view.isUserInteractionEnabled = true
//        if #available(iOS 11.0, *) {
//            view.contentInsetAdjustmentBehavior = .never;
//        }
//        return view
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainCollectionView)
    }
    
    func initModel(){
        
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return MainPageCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}


