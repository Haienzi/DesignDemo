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
  - demo示例：给图片添加滤镜以及调整大小等额外功能。抽象构件ImageEditor封装对图片操作的接口。装饰基类ImageDecorator实现ImageEditor协议定义的接口apply(), BaseFilterDecorator(包括模糊滤镜BlurFilter和颜色滤镜ColorFilter)以及ResizerDecorator作为装饰子类在重写apply方法时，先调用父类的apply方法之后再添加自己的实现，对图片进行添加滤镜或者大小调整的操作。
 
### 外观模式
- 主要思想：
  - 为子系统中的一组接口提供一个统一的入口。
  - 在软件开发中，有时候为了完成一项较为复杂的功能，需要和多个业务交互。外观模式则定义一个类似服务员一样的角色，由它来负责和多个业务类交互，为包含许多活动部件的复杂子系统提供一个简单的接口，而客户类只需与该类交互
- 组成：
  - 外观(Facade)：客户端可以调用它的方法，该角色知道相关的（一个或者多个）子系统的功能和责任；正常情况下，将所有从客户端发来的请求委派到响应的子系统去，传递给相应的子系统对象处理
  - 复杂子系统（SubSystem）：单独的类或者类的集合，实现子系统的功能。每一个子系统都可以被客户端直接调用，或者被外观角色调用，处理由外观传过来的请求；子系统并不知道外观的存在，对于子系统而言，外观角色仅仅是另外一个客户端而已
- 使用场景： 
   - 需要一个指向复杂子系统的直接接口，而且该接口的功能优先，可以使用外观模式
- 应用示例：
  - ios中的应用实例：使用第三方库，使用外观模式包装在客户端代码中使用第三方API的方法。好处：（1）如果需要更改当前的图像下载方法，只需要在一个地方完成修改即可。（2）提供对一小部分功能的访问满足大多数客户的需求，可以设置常用或者默认参数
  - demo示例：使在UIImageView的扩展中通过downloadImage方法包装第三方库SDWebImage异步加载图片的方法，downloadImageByOwn包装自定义实现的图片下载方法对外提供，满足客户端的需求，如果需要更改当前的图像下载方法，只需要在一个地方完成修改即可。
  
### 享元模式
- 主要思想：
  - 主要用于减少创建对象的数量，减少内存占用和提高性能，尝试重用现有的同类对象，如果未找到匹配的对象，则创建新对象。
  - 将具有相同内在状态的对象存储在享元池中，需要的时候将对象从享元池中取出，实现对象的复用，通过向取出的对象注入不同的外部状态，可以得到一系列相似的对象，这些对象在内存中实际上只存储一份。
  - 分为内在状态和外在状态。内在状态，不变的，可以在许多对象中重复使用的数据的成员变量。外在状态，包含每个对象各自不同的情景数据的成员变量。
- 组成：
  - 享元（Flyweight）：包含原始对象中部分能在多个对象中共享的状态。同一个享元对象可以在许多不同的情景中使用，享元中存储的状态称为内在状态，传递给享元方法的状态称为外在状态
  - 情景（Context）：原始对象中各种不同的外部状态。情景和享元组合在一起能表示原始对象的全部状态
  - 享元工厂（FlyWeight Factory）：对已有享元的缓存池进行管理，客户端不需要直接创建享元，只需要调用工厂并传递目标享元的一些内在状态即可，工厂会根据参数在之前已经创建的享元中进行查找，找到满足条件的就返回，否则新建
- 使用场景： 
   - 程序需要生成数量巨大的相似对象，对象中包含能在多个对象间共享的重复状态，会造成内存容量不足的问题
- 应用示例：
  - ios中的应用实例：UITableView Cell缓存池复用机制
  - demo示例：原始对象Cell包括CellType（内部状态）以及Appearance(外部状态),享元工厂AppearanceFactory通过cache缓存池管理已有对象。外部调用时通过向工厂方法传递内在状态的参数来获取所需要的对象，如果在缓存池中找到所需对象就直接返回，否则新建。

## 行为模式

### 责任链模式
- 主要思想：
  - 避免请求发送者与处理者耦合在一起，让多个对象都有可能接收请求，将这些对象连接成一条链，并且沿着这条链传递请求，直到有对象处理它为止。
  - 请求发送者无须知道请求在何时，何处以及如何被处理，实现了请求发送者与处理者的解耦
- 组成：
  - 处理者(Handler)：声明了所有具体处理者的通用接口。通常包含单个方法用于请求处理，同时还会包含设置链上下个处理者的方法
  - 基础处理者(Base Handler)：可选，存储所有处理者共用的逻辑代码
  - 具体处理者(Concrete Handlers)：实现抽象处理者中定义的抽象请求处理方法，在处理请求之前需要进行判断，看看是否有相应的处理全县，如果可以处理请求就处理它，否则将请求转发给下一个处理者，在具体处理者中可以访问链上的下一个对象，进行请求转发。
- 使用场景： 
   - 遇到多个对象可以处理同一请求，具体哪个对象处理该请求要等运行时刻再确定，客户端只需将请求提交，无须关心请求的处理对象是谁以及是如何处理的
- 应用示例：
  - ios中的应用实例：ios事件的传递和响应
  - demo示例：Handler协议声明了处理者统一需要遵循的处理请求方法，next表示下一个处理者对象。当受到注册请求时，会形成LocationHandler->NotificationHandler->SignUpHandler的处理者链，将请求依次转发相应的处理者处理，满足条件的情况下成功注册信息。当收到登录请求时，会形成LocationHandler->LoginHandler的处理者链，将请求转发，地理位置允许的情况下传递给LoginHandler处理登录信息。

### 命令模式
- 主要思想：
  - 将方法调用封装为对象的设计模式，对请求进行封装，一个请求对应一个命令，将请求发送者与接受者解耦。
  - 将请求转换成一个包含与请求相关的所有信息的独立对象。该转换能让根据不同的请求将方法参数化、延迟请求执行或将其放图队列中，实现可撤销操作
- 组成：
  - 抽象命令(Command)：抽象命令类一般是一个抽象类或者接口，在其中声明了用于执行请求的execute()方法，通过这些方法可以调用请求接受者的相关操作
  - 具体命令(ConcreteCommand)：实现在抽象命令中声明的方法，自身并不完成工作，负责调用接受者的逻辑方法
  - 调用者(Invoker):  通过命令对象来执行请求，不需要在设计时确定接受者，只与抽象命令类之间存在关联关系，在运行时调用具体命令的操作方法，实现间接调用请求接收者的相关操作。
  - 接收者(Receiver): 负责具体的功能实现，具体实现细节
- 实现方式
  - 声明仅有一个执行方法的命令接口
  - 抽取请求成为实现命令接口的具体命令类，每个具体命令类会有一组成员变量来保存请求参数和接收者对象的引用，通常通过构造函数进行初始化
  - 调用者类中通过成员变量来保存命令，自身并不创建命令对象，执行具体命令的接口方法来间接的通过接受者完成操作
  - 客户端调用基本流程：创建执行者-> 创建命令（根据需要和接受者关联）-> 创建调用者将其与特定的命令关联
- 使用场景： 
   - 需要将方法调用包装成一个对象，用来延时方法调用，或者让其他组建在对其内部实现细节不了解的情况下进行调用的时候可以使用命令模式
   - 支持撤销和恢复
   - 记录请求日志，当系统故障命令可以重新执行
   - 用对象参数化一个动作以执行操作，并且用不同命令对象来替换回调函数
- 应用示例：
  - ios中的应用实例：Target-Action按钮添加点击事件，NSInvocation:封装了向接受者转发消息所需的必要信息，接收消息的对象target，方法选择器selector和方法参数方法签名，实际调用时只需要获取NSInvocation对象，调用invoke方法即可执行方法；
  - demo示例：CommandProtocol类作为抽象命令类，定义了执行和取消命令的通用接口。EnlargeCommand和ReduceCommand作为具体命令，持有Receiver对象,来间接的实现放大和缩小的操作。Receiver作为请求真正的命令执行者，负责根据参数执行具体的命令，实现放大和缩小的操作。可以通过MyInvoker来调用和取消命令。
 
[{"src":"xap:resources/6df420a1202f136cc2405bcb536b42f0cbb6b4a44ac9708c5b2b44df2efe313d.png"}]![image](https://user-images.githubusercontent.com/26780520/195800059-9a40dad4-5fd2-4fbf-af81-a4575f1a898f.png)
 
### 迭代器模式
- 主要思想：
  - 提供一个方法 顺序访问一个聚合对象中的各个元素，而又不暴露元素的内部表示
  - 通过引入迭代器可以将数据的遍历功能从集合对象中分离出来，集合对象只负责存储数据，而遍历数据则由迭代器完成
- 组成：
  - 迭代器（Iterator）：定义了访问和遍历元素的接口，声明了用于遍历数据元素的方法
  - 具体迭代器(ConcreteIterator)：实现抽象迭代器接口，完成对集合对象的遍历，同时在具体迭代器中通过游标来记录在集合对象中所处的当前位置，在具体实现时，游标通常是一个表示位置的非负正数
  - 集合(Aggregate)：用于存储和管理元素对象，同时声明createIterator方法用于创建迭代器对象
  - 具体集合(ConcreteAggregate)：实现抽象集合类中声明创建迭代器对象的方法，返回一个与该具体聚合类对应的具体迭代器对象实例
- 使用场景： 
   - 访问和遍历集合中的元素时不需要了解内部实现细节，对象的访问和内部数据的存储分离
   - 需要为一个集合对象提供多种遍历方式
   - 为遍历不同的集合结构提供一个统一的接口，在该接口的实现类中为不同的集合结构提供不同的遍历方式，而客户端可以一致性的操作该接口
- 应用示例：
  - ios中的应用实例：枚举器即迭代器
  - demo示例：AbstractIterator表示抽象迭代器，ProductIterator是具体迭代器，实现抽象迭代器的相关方法。AbstractObjectList表示抽象集合对象，定义了创建迭代器对象的方法createIterator，ProductList是具体的集合对象，实现AbstractObjectList中定义的相关方法，并配置对应的迭代器对象。在客户端操作时，通过获取productList的迭代器对象来实现集合对象的遍历操作。
[{"src":"xap:resources/8d56e92d8d5c2f5a2ceacb04974f2ff28d868541e97e2b6d9d706e1f6fd58f3b.png"}]![image](https://user-images.githubusercontent.com/26780520/195801511-2e4313f2-569a-4a16-8558-3676b217d5a7.png)
 
### 中介者模式
- 主要思想：
  - 用一个中介对象来封装一系列的对象交互，中介者使对象不需要显式的互相引用，从而降低耦合度，而且可以独立地改变它们之间的交互。中介者模式又称调停者模式
  - 类似QQ群，管理群的中间类来协调用户对象之间的复杂关系，降低系统的耦合度
  - 买家《--》卖家  转换为 买家 《---》中介《---》卖家
- 组成：
  - 抽象中介者（Mediator）:定义一个接口，用于和各组件对象之间进行通信
  - 具体中介者（ConcreteMediator）：抽象中介者的子类，封装了多种组件间的关系。具体中介者会保存所有的组件的引用并对其进行管理，甚至有时会对其生命周期进行管理
  - 组件（Component)：并不知道其他组件的情况，每一个组件对象在需要和其他组件通信时，先与中介者通信，中介者收到通知后确定发送者，通过中介者来间接完成与其他组件类的通信。对于组件来说，中介者看上去是一个黑箱，发送者不知道最终会由谁来处理自己的请求，接受者也不知道最初是谁发出了请求。
- 使用场景： 
   - 想通过一个中间类来封装多个类中的行为，而又不想生成太多的子类。可以通过引入中介者类来实现，在中介者中定义对象交互的公共行为，如果需要改变行为则可以增加新的具体中介者类。
- 应用示例：
  - ios中的应用实例：MVC模式中的控制器就是中介者，Controller把Model和View分开，协调两者共同工作，把Modle的运行结果和View视图融合成一个前端可以展示的页面，减少M和V的依赖关系
  - demo示例：ScreenUpdatable作为抽象中介者，定义各个组件需要交互的方法，ScreenMediator具体中介者，负责协调各同事组件之间的交互关系，NewsFeedViewController/NewsDetailViewController/ProfilerViewController是同事组件对象，实现自己的业务，通过持有的中介者对象与其他同事组件通信；
[{"src":"xap:resources/087ca0cc16c9813a017e690a72fe584ee89cf32be2591db23f7a20ab669c2ccb.png"}]![image](https://user-images.githubusercontent.com/26780520/195817926-17b63648-5eaa-45d0-aee0-72dbed695d78.png)

### 备忘录模式
- 主要思想：
  - 在不破坏封装的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态，这样可以在以后将对象恢复到原先保存的状态。
  - 提供了一种状态恢复的实现机制，使用户可以方便的回到一个特定的历史步骤，当新的状态无效或者存在问题时，可以使用暂时存储起来的备忘录恢复状态
- 组成：
  - 原发器(Originator):记录当前时刻的内部状态，提供创建和恢复备忘录的功能，也可以实现其他业务功能，可以访问备忘录里的所有信息
  - 备忘录（Memento）：是原发器状态快照的值对象，存储原发器的内部状态，通常将备忘录设置为不可变的，并通过构造函数一次性传递数据
  - 负责人（Caretaker）：负责人通过保存备忘录栈来记录原发器的历史状态。 负责保存备忘录，但是不能对备忘录的内容进行操作或检查。只负责存储备忘录对象，不能修改对象，也无须知道对象的实现细节。
- 使用场景： 
   - 保存一个对象在某一个时刻的全部状态或者部分状态，以后需要时可以恢复到先前的状态，实现撤销操作
   - 防止外界对象破坏一个对象历史状态的封装性，避免将对象历史状态的实现细节暴露给外界对象
- 应用示例：
  - ios中的应用实例：CocoaTouch框架（Foundation和UIKit框架）归档解档，属性列表序列化（实现NSCoding协议）
  - demo示例：使用备忘录模式保存textview的历史文本状态，可以是textView恢复到上次展示的文本内容
 
 
### 观察者模式
- 当对象间存在一对多关系时，则使用观察者模式。当一个对象被修改时，会自动通知依赖它的对象。观察者模式中有两个主要角色Subject和观察者Observer
- 观察者模式通常需要在Subject类中维护一个Observer观察者数组，只要Subject类中有一些事件变化就可以通知所有的观察者并执行相应逻辑
- 使用场景
  - 一个对象的改变将导致其他一个或多个对象发生改变，而不知道具体有多少对象将发生改变，可以降低对象之间的耦合度
  - 一个对象必须通知其他对象，而并不知道这些对象是谁
  - 为一些关键节点（比如View的生命周期）定义通知，当这些关键节点产生变化时通知对应的观察者，相比代理可以降低对象之间的耦合度
  
### 状态模式
- 主要思想：
  - 用于解决系统中复杂对象的状态转换以及不同状态下行为的封装问题
  - 允许一个对象在其内部的状态改变时改变它的行为，对象看起来似乎修改了它的类。其别名为状态对象，状态模式是一种对象行为型模式
  - 状态模式将一个对象在不同状态下的不同行为封装在一个个状态类中，通过设置不同的状态对象可以让环境对象拥有不同的行为，状态转换的细节对于客户端来说是透明的，方便了客户端的使用
- 组成：
  - 抽象状态类（State）：封装与环境类的一个特定状态相关的行为，在抽象状态类中声明了各种不同状态对应的方法，而在其子类中实现这些方法，由于不同状态下对象的行为可能不同，因此在不同子类中方法的实现可能存在不同，相同的方法可以写在抽象状态类中
  - 具体状态类（ConcreteState）：抽象状态类的子类，每个子类实现一个与环境类的一个状态相关的行为，每一个具体状态类对应环境的一个具体状态，不同的具体状态类行为有所不同
  - 上下文环境（Context）:拥有多种状态的对象。由于环境类的状态存在多样性且在不同状态下对象的行为有所不同，因此将状态独立出去形成单独的状态类。在环境类中维护一个抽象状态类State的实例，这个实例定义当前状态，在具体实现时，它是一个State子类的对象
- 使用场景： 
   - 对象的行为依赖于它的状态（比如某些属性值），在运行时状态的改变将导致行为的改变
   - 代码中包含大量与对象状态有关的条件语句，这些条件语句的出现，会导致代码的可维护性和灵活性变差，不能方便的增加和删除状态，并且导致客户类和类库之间的耦合增强
- 应用示例：
  - 应用示例：业务中的会员机制，游戏中的等级机制
  - demo示例：不同等级的会员，同一操作有不同的执行结果。MemberState作为抽象状态，声明了不同状态类对应的操作方法handle()。NormalMemberState/GoldMemberState/DiamondMemberState作为具体状态类，在handle方法中实现自己的行为，User作为上下文环境类，通过属性state引用抽象状态，在运行时根据根据不同的等级划分，返回不同的会员状态，不需要再使用复杂的if-else来判断状态再调用对象的业务方

### 策略模式
- 主要思想：
  - 将方法的定义放在专门的策略类中，每一个具体策略类封装了一种实现方法
  - 定义一系列方法并将每种算法放入独立的类中，使方法的对象能够相互替换
  - 策略基于组合机制，可以通过对相应行为提供不同的策略来改变对象的部分行为，在对象层次上运行，允许在运行时切换行为，Context可以使用相同的接口访问算法的各种变体
- 组成：
  - 上下文环境（Context）：使用算法的角色，在解决某个问题时，可以采用多种策略。在环境类中维持一个对抽象策略类的引用实例，用于定义所采用的策略
  - 策略（Strategy）：所有具体策略的通用接口，Context通过抽象策略类中声明的方法在运行时调用具体策略类中实现的算法
  - 具体策略（ConcreteStrategies）：实现了抽象策略类中声明的算法，在运行时，覆盖在Context中定义的抽象策略类对象，使用一种具体的算法实现某个业务处理
- 使用场景： 
   - 涉及到算法的封装、复用和切换都可以使用策略模式
   - 一个系统需要动态的在几种算法中选择一种，可以将这些算法封装到一个个的具体算法类中
- 应用示例：
  - ios中的应用实例：MVC模式中，控制器决定视图对模型数据进行显示的时机和内容。同一个视图如果与不同的控制器合作，数据内容随着不同的控制器而不同，这时控制器就是视图的策略
  - demo示例：同一类型对象通过不同的方式加载数据模型。DataSource定义不同存储策略所需要遵循的同一接口loadModels。在ListController中通过属性datasoure来引用DataSource类型的策略，通过传入MemoryStorage/CoreDataStorage/RealmStorage等具体策略类型的对象，在展示模型时调用具体策略中实现的算法。

### 模版方法模式
- 主要思想：
  - 定义一个操作中算法的框架，将一些步骤延迟到子类中。模板方法模式使得子类可以不改变一个算法的结构即可重定义该算法的某些特定步骤
  - 基于继承的代码复用技术，确保通过父类来控制处理流程中的逻辑顺序
- 组成：
  - 抽象类（AbstractClass）：声明作为算法步骤的方法，以及依次调用他们的实际模板方法（定义一个算法框架）。算法步骤可以声明为抽象类型也可以提供一些默认实现
  - 具体子类（ConcreteClass）：用于重写在父类中声明的抽象基本操作，也可以覆盖在父类中已经实现的具体基本操作，但是不能重写模板方法
  - 模板方法：定义在抽象类中的，把基本操作方法组合在一起形成一个总算法或一个总行为的方法, 并由子类不加以修改的完全继承下来
  - 钩子方法：由一个抽象类或具体类声明并实现，而其子类可能会加以扩展。
    - 第一类钩子方法：与一些具体步骤挂钩，实现在不同条件下执行模板方法中的不同步骤，返回类型通常是bool类型的
    - 第二类钩子方法：实现体为空的具体方法，子类如果没有覆盖父类中定义的钩子方法，编译可以正常通过
- 使用场景： 
   - 只希望客户端扩展某个特定算法步骤， 而不是整个算法或其结构时， 可使用模板方法模式
   - 对一些复杂的算法进行分割，将算法中固定不变的部分设计为模板方法和父类具体方法，而一些可以改变的细节由子类来实现。即：一次性实现一个算法的不变部分，并将可变的行为留给子类来实现
- 应用示例：
  - ios中的应用实例：UIViewController生命周期函数、UIView的drawRect，子类可以重写该方法实现自定义视图
  - demo示例：使用模版方法演示申请权限时的基本算法步骤。PermissionAccessor作为请求权限抽象类，在requestAccessIfNeeded方法中定义了请求权限时的基本算法步骤，先判断是否有权限hasAccess(), willReceiveAccess()定义将要申请权限前的一些操作，requestAccess()请求权限，didReceiveAccess和didRejectAccess分别定义了同意授权和拒绝授权时的处理操作。CameraAccessor、MicroPhoneAccessor、PhotoLibraryAccessor重写基本操作。

### 访问者模式
- 主要思想：
  - 提供一个作用于某对象结构中各元素的操作表示，使可以在不改变各元素的类的前提下定义作用于这些元素的新操作，不同的访问者会产生不同的操作。
  - 目的是将处理从数据结构中分离出来，可以用不同的方式操作复杂对象数据结构，使操作结合可以自由变化。
- 组成：
  - 抽象访问者：为对象结构中每一个具体元素声明一个访问操作，具体访问者需要实现这些操作方法，定义对这些元素的访问操作
  - 具体访问者：实现抽象访问者中定义的方法，每一个操作用于访问对象结构中一种类型的元素
  - 抽象元素：抽象元素一般是抽象类或者接口，持有抽象访问者。
  - 具体元素：实现抽象元素中定义的方法，在方法中调用访问者的访问方法以便完成对一个元素的操作。
  - 对象结构：元素的集合，存放元素对象，并提供了遍历内部元素的方法，可以结合组合模式，也可以是一个简单的集合对象，比如List对象或者Set对象。
- 使用场景： 
   - 需要对一个组合结构中的对象进行很多不相关的操作，但是不想让这些操作污染这些对象的类，将相关的操作封装起来，定义在一个访问者类中，并在访问者定义的操作中使用它
   - 当一个数据结构中，一些元素类需要负责与其不相关的操作的时候，为了将这些操作分离出去，减少元素类的职责时，可以使用访问者模式
   - 有时在对数据结构上的元素进行操作的时候，需要区分具体的类型，这时使用访问者模式可以针对不同的类型，在访问者类中定义不同的操作，从而去除类型判断
   - 系统的数据结构是频繁变化的，则不适合使用访问者模式
- 应用示例：
  - demo示例：绘制手指滑动的痕迹。Mark作为抽象元素，是Stroke、Dot、Vertex的父类，定义了通用的属性和方法，其中acceptMarkVisitor用来接收访问者。Stroke是元素集合，包含了若干Mark子元素,结合组合模式的思想，在实现acceptMarkVisitor方法时，依次遍历子元素，调用子元素的对应实现方法。MarkVisitor作为抽象访问者，定义了对Mark、Vertex、Dot、Stroke每一个元素的访问行为，MarkRender作为具体的绘制访问者，给出对每一个元素访问时的具体操作。
  
 
