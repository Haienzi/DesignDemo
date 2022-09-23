# DesignDemo
设计模式学习与实践

## 六大原则
- 单一职责原则(一个类和方法只做一件事)
- 里氏替换原则(多态，子类可扩展父类)
- 依赖倒置原则(面向接口编程)
- 接口隔离
- 迪米特原则
- 开闭原则

## 创建型模式

### 工厂方法模式
- 在父类中提供一个创建对象的方法，允许子类决定实例化对象的类型, 定义一个创建对象的接口，让子类自己决定实例化哪一个工厂类，使创建过程延迟到子类进行,考虑的是一类产品的生产.
- Demo模仿首页卡片的初始化。通过MainPageCellFactory来按照数据类型初始化不同的卡片，在不关心内部具体实现的情况下可以通过MainPageCell按照统一的方式进行修改，每一种卡片的具体处理在本类中进行实现，容易扩展

### 抽象工厂模式
- 为了让创建工厂和一组产品与使用相分离，并可以随时切换到另一个工厂以及另一组产品
- 抽象工厂模式实现的关键点是定义工厂接口和产品接口，但如何实现工厂与产品本身需要留给具体的子类实现，客户端只和抽象工厂和抽象产品打交道
- 单一职责，开闭原则、解耦
- 抽象工厂方法模式：工厂和产品都是抽象的，每个具体工厂负责一类产品的实现，可以随时切换到另一组工厂和产品。假设A和B的视图都包括顶部、中腰，通过ViewAbstractFactory来统一定义创建顶部视图和中腰视图的接口，MainViewFactoryA和MainViewFactoryB作为具体的工厂来创建顶部和中腰的视图组合，可以根据数据实现视图组合的切换，满足单一职责原则。

### 单例模式
- 保证在程序运行过程中一个类只有一个实例（即使多线程访问），并需要提供一个全局访问此实例的点。使用场合，共享的资源只需要初始化一次，让这个类创建出来的对象永远只有一个。
- 单例模式主要解决的是：一个全局使用的类频繁的创建和消费，从而提升代码的性能.

### 建造者模式
- 主要思想是将多个简单对象通过一步步组装构建出一个复杂对象的过程。工厂模式关注的是一个产品整体，不需要关注各部分是如何构建出来的，建造者模式则关注产品组成部分的创建过程，通过不同的组件，不同设置可以产生不同的复杂对象。
- Demo使用建造者模式简单模拟弹出视图的构建。弹出视图MyPopupView包括顶部标题，中间视图，底部按钮（确定和取消按钮，先创建者排列在前，也可以只创建一个）。使用者通过调用建造者PopupViewBuilder对象的装配方法来设置弹出视图的标题，中间内容视图，底部按钮点击事件，按钮标题，视图圆角等属性。
- 建造者模式和工厂模式的区别是：
  - 工厂模式关注的是一个产品整体，生产出的产品具有相似的功能和结构，不需要关注产品的各部分是如何建造出来的
  - 建造者模式关注的是产品的组成部分的创建过程，通过不同的部件，不同装配产生不同的复杂对象，产品类调用顺序不同可能产生不同的作用

## 结构型模式
### 代理模式
- 定义：为其他对象提供一种代理来控制对这个对象的访问，组成部分包括协议(用来指定代理双方要做什么事情)，代理(根据指定的协议，完成协议规定的事情)，委托(根据指定的协议，指定代理去完成事情).
- Demo实践了两种应用场景，第一种通过代理设计模式的思想，将UITableView的数据操作交给一个代理对象去实现，减少使用时控制器的代码量。另外实现一对多的代理模式（使用通知实现时需要移除通知），使用DelegateManager管理delegate数组，截获方法数组遍历调用相应方法，当委托方调用方法时，所有注册了协议的类都会接受到协议的方法回调。ATestViewController和BTestViewController都实现了TestViewDelegate协议，并将代理对象设置为DelegateManage，ATestView作为委托者调用相应方法后A和B都将接受到方法回调。

### 适配器模式
- 主要思想：把原本不兼容的接口，通过适配修改到统一，做不同接口的兼容。使得原本由于接口不兼容而不能一起工作的类可以一起工作。
- 实现方式：
  - 类适配器（使用继承)
    - 定义现在客户端将要使用的协议
    - 使用适配器类Adapter实现这个协议
    - 适配器类继承自被适配者Adaptee（与现有客户端不兼容的类）
  - 对象适配器（使用组合):
    - Adapter不继承Adaptee，而是使用对象组合：Adapter持有一个Adaptee的实例引用
    - 代理模式属于对象适配器
- 对象适配器和类适配器的区别：
  - 类适配器：
    - 只针对单一的具体的Adaptee类，把Adaptee适配到Target
    - 通过子类的形式适配，易于重载Adaptee的行为
    - 不需要额外的指针指向Adaptee
  - 对象适配器
    - 通过持有对象的方式，可以适配多个adaptee
    - 难以重载Adaptee的行为，需要借助对象实现
    - 需要额外的指针间接访问Adaptee适配其行为
- 使用场景
  - 已有类的接口与需求不匹配
  - 面对遗留代码，期望项目统一使用新特性同时兼容已有类
  - 扩展新功能，方便接入新的第三方库
- 应用示例：
  - iOS中一般通过协议（Target为接口）来实现适配器。例如UITableViewDelegate和UITableViewDataSource,将原本不能为UITableView提供数据操作事件的其他类
（UIView,UIViewController等）包装成数据源代理，即为类适配器的应用。

### 桥接模式
- 主要思想：
  - 将抽象部分与实现部分分离，把多种可匹配的使用进行组合。
  - 抽象层定义了供客户端使用的上层的抽象接口，使用对象的组合关系，解耦抽象和实现之间固有的绑定关系，使抽象和实现可以沿着各自的维度变化(子类化)，实现在多个维度上的独立变化
- 实现：存在两个base类，BaseA和BaseB，每个都有很多不同的子类，BaseA持有BaseB的一个实例，BaseA的子类调用方法时，会调用持有的BaseB类的实例方法（在使用时，BaseB类的实例被赋值一个初始化了的实现子类）
- 使用场景：
  - 不想在抽象类和实现类之间形成固定的绑定关系，可以在运行的时候切换
  - 抽象类不能影响调用者的代码
  - 从实现中把抽象分离出来，又联系在一起
- 应用示例：
  - 通过模拟微信和支付宝两个支付渠道在不同的支付模式（密码、刷脸、指纹）的组合，在支付渠道的抽象类中持有支付模式抽象类，在支付渠道子类中调用支付模式父类的桥接方法，实现抽象子类和实现子类之间的沟通

### 组合模式
- 主要思想：
  - 组合多个对象形成树形结构表示具有“整体-部分”关系的层次结构。组合模式对单个对象（叶子对象）和组合对象（容器对象）的使用具有一致性。
  - 关键是定义了一个抽象构件类，既可以代表叶子，也可以代表容器，客户端针对该构件类进行编程，不需要知道是叶子还是容器，可以统一处理
- 实现：
  - Component(抽象组件)：可以是接口或者抽象类，声明组合中简单和复杂对象的通用操作，可以包含所有子类共有行为的声明和实现
  - Leaf(叶子构件):在组合结构中表示叶子结点对象（子类），没有子节点，实现了接口或者抽象类中定义的行为
  - Composite(容器组件)：表示可能包含子项目的复杂组件，（子项目可以是叶子节点也可以是容器节点），通常将实际工作委派给子项目（递归调用子节点的业务方法），实现抽象构件中定义的行为，收集和汇总结果。
- 使用场景： 
   - 在部分-整体这种层次结构下，客户端需要同样对待单独的对象以及组合的对象
- 应用示例：
  - UIView组织结构使用了组合模式，每个UIVIew的实例可以包含UIView的其他实例，形成统一的树形结构，让客户端对单个View对象和UIView的组合统一对待。
视图的树形结构根部是一个UIWindow对象和它的内容视图，添加进来的UIView是子视图，同时可以拥有自己的子视图。UIView对象只能拥有一个父视图，可以又零到多个子视图。
  - 定义数据模型时，会包含数组类型的字段，数组中数据对应着另外的一个数据模型。比如负反馈模型数据，每个负反馈选项对应着负反馈标签模型，数据初始化递归初始化数组模型的数据。
  - demo示例：给视图设置不同模式的主题。Component协议定义了UIViewController/UIView/UIButton/UILabel需要统一遵循的方法accept<T:Theme>， 同时各个视图依次实现accept方法，为相关属性应用主题样式，其中UIViewController实现accept方法时需要遍历view的子视图的accpet方法来应用主题样式。可以单独的给UIButtoen或者UILabel设置样式，也可以给UIViewController设置整体的样式。
  
### 装饰器模式
- 主要思想：
  - 为对象动态添加职责，扩展系统功能。在不改变原有类的基础上给类新增功能。不改变原有类继承和AOP切面同样可以实现。
- 实现：
  - 抽象构件(Component)：定义一个抽象接口规范准备增加新功能的对象
  - 具体构件(ConcreateComponent):具体组件提供操作的默认实现。这些类在程序中可能会有几个变体。
  - 抽象装饰(Decorator)：该类的主要任务是定义所有具体装饰的封装接口，并且和其他组件遵循相同的接口。封装的默认实现代码中可能会包含一个保存被封装组件的成员变量，同时负责对其进行初始化。装饰基类会直接将所有工作分派给被封装组件。具体装饰中则可以新增一些额外的行为。
  - 具体装饰(ConcreateDecorator)：定义了可动态添加到部件的额外行为。 具体装饰类会重写装饰基类的方法， 并在调用父类方法之前或之后进行额外的行为。
- 使用场景： 
   - 无需修改代码的情况下即可使用对象， 且希望在运行时为对象新增额外的行为， 可以使用装饰模式
   - 用继承来扩展对象行为的方案难以实现或者不可行(例如final)
- 应用示例：
  - ios中的应用实例：objc的分类可以在不进行子类化的前提下方便的对已有类添加方法，不是严格的装饰器模式实现方式，是在编译时实现的。
  - demo示例：给图片添加滤镜以及调整大小等额外功能。抽象构件ImageEditor封装对图片操作的接口。装饰基类ImageDecorator实现ImageEditor协议定义的接口apply(), BaseFilterDecorator(包括模糊滤镜BlurFilter和颜色滤镜ColorFilter)以及ResizerDecorator作为装饰子类在重写apply方法时，先调用父类的apply方法之后再添加自己的实现，对图片进行添加滤镜或者大小调整的操作。。
 
### 外观模式
- 主要思想：
  - 为子系统中的一组接口提供一个统一的入口。
  - 外观类为包含许多活动部件的复杂子系统提供一个简单的接口，与直接调用子系统相比，外观提供的功能比较优先，但是包含了客户端真正关心的功能。
  - 在软件开发中，有时候为了完成一项较为复杂的功能，需要和多个业务交互。外观模式则定义一个类似服务员一样的角色，由它来负责和多个业务类交互，而客户类只需与该类交互
- 组成：
  - 外观(Facade)：客户端可以调用它的方法，该角色知道相关的（一个或者多个）子系统的功能和责任；正常情况下，将所有从客户端发来的请求委派到响应的子系统去，传递给相应的子系统对象处理
  - 复杂子系统（SubSystem）：单独的类或者类的集合，实现子系统的功能。每一个子系统都可以被客户端直接调用，或者被外观角色调用，处理由外观传过来的请求；子系统并不知道外观的存在，对于子系统而言，外观角色仅仅是另外一个客户端而已
- 使用场景： 
   - 需要一个指向复杂子系统的直接接口，而且该接口的功能优先，可以使用外观模式
- 应用示例：
  - ios中的应用实例：使用第三方库，使用外观模式包装在客户端代码中使用第三方API的方法。好处：（1）如果需要更改当前的图像下载方法，只需要在一个地方完成修改即可。（2）提供对一小部分功能的访问满足大多数客户的需求，可以设置常用或者默认参数
  - demo示例：使在UIImageView的扩展中通过downloadImage方法包装第三方库SDWebImage异步加载图片的方法，downloadImageByOwn包装自定义实现的图片下载方法对外提供，满足客户端的需求，如果需要更改当前的图像下载方法，只需要在一个地方完成修改即可。
  

## 行为模式
### 观察者模式
- 当对象间存在一对多关系时，则使用观察者模式。当一个对象被修改时，会自动通知依赖它的对象。观察者模式中有两个主要角色Subject和观察者Observer
- 观察者模式通常需要在Subject类中维护一个Observer观察者数组，只要Subject类中有一些事件变化就可以通知所有的观察者并执行相应逻辑
- 使用场景
  - 一个对象的改变将导致其他一个或多个对象发生改变，而不知道具体有多少对象将发生改变，可以降低对象之间的耦合度
  - 一个对象必须通知其他对象，而并不知道这些对象是谁
  - 为一些关键节点（比如View的生命周期）定义通知，当这些关键节点产生变化时通知对应的观察者，相比代理可以降低对象之间的耦合度

