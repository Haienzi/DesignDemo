//
//  ViewController.swift
//  DesignDemo
//
//  Created by mqh on 2022/7/25.
//

import UIKit

extension UIView{
    //swift extension 增加存储类型属性
    private struct AssociatedKey {
        static var registerMapFlag1:[String: Bool] = [:]
    }
    
    public var registerMapFlag1: [String: Bool] {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.registerMapFlag1) as? [String: Bool] ?? [:]
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.registerMapFlag1, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

class ViewController: UIViewController {

    let subjectName = "NOTIFICATION_SUBJECT"
    let notificationObserver = "notificationObserver"
    let notificationTest = "notificationTest"
    var isSelected:Bool = false
    
    private lazy var button: UIButton = {
        let btn = UIButton(frame: CGRect.init(x: 100, y: 100, width: 200, height: 50))
        btn.center = view.center
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.setTitleColor(.black, for: .normal)
        btn.setTitleColor(.black, for: .selected)
        btn.setTitle("发送创建弹窗的通知", for: .normal)
        btn.setTitle("发送属性测试的通知", for: .selected)
        btn.addTarget(self, action:#selector(onBtnClick) , for: .touchUpInside)
        return btn
    }()
    
    @objc func onBtnClick(sender: UIButton) {
        sender.isSelected = !isSelected
        //给subjectName的所有Observer发送通知
        MyNotificationCenter.singleton.postNotification(subjectName: subjectName)
        //给特定的Observer发送通知
        MyNotificationCenter.singleton.postNotification(name: notificationTest, object: self, subjectName: subjectName, userInfo: [:])
        isSelected = !isSelected
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view.
//        redView.registerMapFlag1["test"] = false
//        print(redView.registerMapFlag1["test"] ?? "test")
        view.addSubview(button)
         MyNotificationCenter.singleton.addMyObserver(aObserver: self, aSelector: #selector(testObserverA), notificationName:notificationObserver , subjectName: subjectName)
        MyNotificationCenter.singleton.addMyObserver(aObserver: self, aSelector: #selector(testProperty), notificationName:notificationTest , subjectName: subjectName)
        NotificationCenter.default.addObserver(self, selector: #selector(testProperty), name: NSNotification.Name.init(rawValue: notificationObserver), object: nil)
    
    }
    
    
    @objc func testObserverA(){
//        let girl = Girl()
//        girl.setName()
//        print(girl.name)
//        let person = Person()
//        print(person.name)
        
        let subject = Subject()
        let observerA = ObserverA(name: "ObserverA")
        let observerB = ObserverB(name: "ObserverB")
        
        subject.addObserver(observer: observerA)
        subject.addObserver(observer: observerB)
        
        subject.someBussinessLogic()
        subject.deleteObserver(observer: observerB)
        subject.someBussinessLogic()
    }
    
    @objc func testProperty() -> Void {
        let girl = Girl()
        girl.setName()
        print(girl.name)
        let person = Person()
        print(person.name)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        MyNotificationCenter.singleton.removeMyObserver(observer: self, subjectName: subjectName)
    }

}

