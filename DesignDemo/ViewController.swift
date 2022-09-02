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
        //测试桥接模式
        testBridge()
        //测试组合模式
        testComposite()
    
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
    
    //测试桥接模式
    func testBridge(){
        let wxPay = WxPay.init(payMode: PayFingerPrintMode.init())
        wxPay.transfer(id: "007", tradeId: "1234566", amount: 10000)
        
        let zfbPay = ZfbPay.init(payMode: PayCyper.init())
        zfbPay.transfer(id: "077", tradeId: "1234567", amount: 1000)
    }
    
    //测试组合模式
    func testComposite(){
        let root = Composite.init(name: "root")
        root.add(component: Leaf.init(name: "LeafA"))
        root.add(component: Leaf.init(name: "LeafB"))
        
        let comA = Composite.init(name: "CompositeA")
        comA.add(component: Leaf.init(name: "LeafAA"))
        comA.add(component: Leaf.init(name: "LeafAB"))
    
        let comB = Composite.init(name: "CompositeAC")
        comB.add(component: Leaf.init(name: "LeafACA"))
        comB.add(component: Leaf.init(name: "LeafACB"))
        comA.add(component: comB)
        
        root.add(component: comA)
        root.display(depth: 0)
        
//        0 Level root
//        1 Level LeafA
//        1 Level LeafB
//        1 Level CompositeA
//        2 Level LeafAA
//        2 Level LeafAB
//        2 Level CompositeAC
//        3 Level LeafACA
//        3 Level LeafACB
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        MyNotificationCenter.singleton.removeMyObserver(observer: self, subjectName: subjectName)
    }

}

