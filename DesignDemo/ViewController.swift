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
        btn.setTitle("主题测试", for: .normal)
        btn.setTitle("测试", for: .selected)
        btn.addTarget(self, action:#selector(onBtnClick) , for: .touchUpInside)
        return btn
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel(frame: CGRect.init(x: 100, y: 100, width: 200, height: 50))
        label.text = "设计模式测试"
        return label
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
        view.addSubview(label)
         MyNotificationCenter.singleton.addMyObserver(aObserver: self, aSelector: #selector(testObserverA), notificationName:notificationObserver , subjectName: subjectName)
        MyNotificationCenter.singleton.addMyObserver(aObserver: self, aSelector: #selector(testProperty), notificationName:notificationTest , subjectName: subjectName)
        NotificationCenter.default.addObserver(self, selector: #selector(testProperty), name: NSNotification.Name.init(rawValue: notificationObserver), object: nil)
        //测试桥接模式
        testBridge()
        //测试组合模式
        testCompositeReal()
        //测试装饰器模式
        //testDecorator()
    
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
        print(wxPay.transfer(id: "007", tradeId: "1234566", amount: 10000))
        
        let zfbPay = ZfbPay.init(payMode: PayCyper.init())
        print(zfbPay.transfer(id: "077", tradeId: "1234567", amount: 1000))
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
    
    //组合模式真实应用场景
    func testCompositeReal(){
        print("UIButton应用默认主题样式")
        apply(theme: DefaultButtonTheme(), for:self.button)
        print("UIButton应用暗夜主题样式")
        apply(theme: NightButtonTheme(), for: UIButton())
        
        print("ViewController应用默认主题样式")
        apply(theme: DefaultButtonTheme(), for:ViewController())
        print("ViewController应用暗夜主题样式")
        apply(theme: NightButtonTheme(), for: self)
        
    }
    
    func apply<T: Theme>(theme: T, for component: Component){
        component.accept(theme: theme)
    }
    
    //测试装饰器模式
    func testDecorator(){
        //注意galen的类型 声明变量的类型为抽象构件类型
//        var galen:Hero = Galen()
//        galen = RedBuffDecorator.init(hero: galen)
//        galen.blessBuff()
//
//        galen = BlueBuffDecorator.init(hero: galen)
//        galen.blessBuff()
//
        let image = loadImage()
        let resizer = ResizerDecorator(image, xScale: 0.2, yScale: 0.2, hasAlpha: false)
        
        let blurFilter = BlurFilter(resizer)
        blurFilter.update(redius: 2)
        
        let colorFilter = ColorFilter(blurFilter)
        colorFilter.update(contrast: 0.53)
        colorFilter.update(saturation: 0.22)
        colorFilter.update(brightness: 0.56)
        
        clientCode(editor: colorFilter)
    }
    
    func clientCode(editor: ImageEditor){
        let image = editor.apply()
        print("Client: all changes have been applied for \(image)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        MyNotificationCenter.singleton.removeMyObserver(observer: self, subjectName: subjectName)
    }
    
    func loadImage() -> UIImage {
        let url = "https://pic2.58cdn.com.cn/images/xq_img/n_v297a33c9ce61848a284d2a525e4100368.png"
        guard let url = URL(string: url) else {
            fatalError("please enter a valid URL")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Cannot load an image")
        }
        
        guard let image = try? UIImage(data: data) else {
            fatalError("Cannot create an image from data")
        }
        
        return image
    }

}

extension ViewController {
    override var description: String {
        return "ViewController"
    }
}

