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
        //testBridge()
        //测试组合模式
        //testCompositeReal()
        //测试装饰器模式
        //testDecorator()
        //测试责任链模式
//        testChainOfResponsibilityRealWorld()
        //测试备忘录模式
        //testMemento()
        
        testMediator()
    
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
        apply(theme: DefaultButtonTheme(), for:self.button as! Component)
        print("UIButton应用暗夜主题样式")
        apply(theme: NightButtonTheme(), for: UIButton() as! Component)
        
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
        let resizer = ResizerDecorator(image as! ImageEditor, xScale: 0.2, yScale: 0.2, hasAlpha: false)
        
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
    
    //测试责任链模式
    func testChainOfResponsibilityRealWorld() {
        print("测试责任链模式")
        let signUpHandler = SignUpHandler(with: LocationHandler(with: NotificationHandler()))
        let signUpController = SignUpViewController(handler: signUpHandler)
        signUpController.signUpButtonSelected()
        
        let loginHandler = LoginHandler(with: LocationHandler())
        let loginController = LoginViewController(handler: loginHandler)
        loginController.loginButtonSelected()
    }
    
    //测试命令模式
    func testCommandRealWorld(){
        let siri = SiriShortcuts.shared
        
        siri.perform(.leaveHome)
        siri.perform(.leaveWork, delay: 5)
        siri.cancel(action: .leaveWork)
    }
    
    //测试迭代器模式
    func testIterator(){
        let products = ProductList()
        products.add("迭代器模式")
        products.add("开始测试")
        products.add("demo写完了吗")
        let iterator = products.createIterator()
        while(!iterator.hasLast()){
            print(iterator.getCurrentItem())
            iterator.next()
        }
        
    }
    
    //测试中介者模式
    func testMediator(){
        let newsArray = [News(id: 1, title: "惊天动地大新闻1", likesCount: 1),
                         News(id: 2, title: "惊天动地大新闻2", likesCount: 2),
                         News(id: 2, title: "惊天动地大新闻3", likesCount: 3)]
        //累加
        let numberOfGivenLikes = newsArray.reduce(0, { $0 + $1.likesCount })
        let mediator = ScreenMediator()
        let feedVC = NewsFeedViewController(mediator, newsArray)
        let newsDetailVC = NewsDetailViewController(mediator, newsArray.first!)
        let profileVC = ProfileViewController(mediator, numberOfGivenLikes)
        mediator.update([feedVC, newsDetailVC, profileVC])
        feedVC.userLikedAllNews()
        feedVC.userDislikedAllNews()
    }
    
    //测试备忘录模式
    func testMemento(){
        let textView = UITextView()
        let undoStack = UndoStack(textView)
        
        textView.text = "First Change"
        undoStack.save()
        
        textView.text = "Test Memento"
        undoStack.save()
        
        textView.text = textView.text + " & TextView Third Change"
        textView.textColor = .purple
        undoStack.save()
        
        print(undoStack)
        print("Client: Perform undo operation 2 times\n")
        undoStack.undo()
        undoStack.undo()
        
        print(undoStack)
    }
    
    func testStrategy(){
        let controller = ListController()
        
        let memoryStorage = MemonryStorage()
        memoryStorage.add(items: usersFromNetwork())

        clientCode(use: controller, with: memoryStorage)
        clientCode(use: controller, with: CoreDataStorage())
        clientCode(use: controller, with: RealmStorage())
    }
    
    func clientCode(use controller: ListController, with dataSource: DataSource) {
        controller.update(dataSource: dataSource)
        controller.displayModels()
    }

    private func usersFromNetwork() -> [StrategyUser] {
        let user1 = StrategyUser(id: 1, userName: "testMemoryStorage")
        let user2 = StrategyUser(id: 2, userName: "testCoreDataStorage")
        let user3 = StrategyUser(id: 3, userName: "testRealmStorage")
        
        return [user1, user2, user3]
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
