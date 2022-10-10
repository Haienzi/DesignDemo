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
  - 对请求进行封装，一个请求对应一个命令，将请求发送者与接受者解耦。
  - 将请求转换成一个包含与请求相关的所有信息的独立对象。该转换能让根据不同的请求将方法参数化、延迟请求执行或将其放图队列中，实现可撤销操作
- 组成：
  - 抽象命令(Command)：抽象命令类一般是一个抽象类或者接口，在其中声明了用于执行请求的execute()方法，通过这些方法可以调用请求接受者的相关操作
  - 具体命令(ConcreteCommand)：实现在抽象命令中声明的方法，负责调用接受者的逻辑方法
  - 调用者(Invoker):调用执行命令。
  - 接收者(Receiver)：负责具体的功能实现，具体实现细节
- 使用场景： 
   - 需要将方法调用包装成一个对象，用来延时方法调用，或者让其他组建在对其内部实现细节不了解的情况下进行调用的时候可以使用命令模式
   - 支持撤销和恢复
   - 记录请求日志，当系统故障命令可以重新执行
   - 用对象参数化一个动作以执行操作，并且用不同命令对象来替换回调函数
- 应用示例：
  - ios中的应用实例：Target-Action,按钮添加点击事件
  - demo示例：
 
### 迭代器模式
- 主要思想：
  - 通过引入迭代器可以将数据的遍历功能从集合对象中分离出来，集合对象只负责存储数据，而遍历数据则由迭代器完成。
  - 迭代器通常会提供一个获取集合元素的基本方法。客户端可以不断调用该方法直至它不返回任何内容（遍历完了所有元素）
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
  - demo示例：
 
### 中介者模式
- 主要思想：
  - 用一个中介对象来封装一系列的对象交互，中介者使对象不需要显式的互相引用，从而降低耦合度，而且可以独立地改变它们之间的交互。中介者模式又称调停者模式
  - 类似QQ群，管理群的中间类来协调用户对象之间的复杂关系，降低系统的耦合度
- 组成：
  - 抽象中介者（Mediator）:定义一个接口，用于和各组件对象之间进行通信
  - 具体中介者（ConcreteMediator）：抽象中介者的子类，封装了多种组件间的关系。具体中介者会保存所有的组件的引用并对其进行管理，甚至有时会对其生命周期进行管理
  - 组件（Component)：并不知道其他组件的情况，每一个组件对象在需要和其他组件通信时，先与中介者通信，中介者收到通知后确定发送者，通过中介者来间接完成与其他组件类的通信。对于组件来说，中介者看上去是一个黑箱，发送者不知道最终会由谁来处理自己的请求，接受者也不知道最初是谁发出了请求。
- 使用场景： 
   - 想通过一个中间类来封装多个类中的行为，而又不想生成太多的子类。可以通过引入中介者类来实现，在中介者中定义对象交互的公共行为，如果需要改变行为则可以增加新的具体中介者类。
- 应用示例：
  - ios中的应用实例：MVC模式中的控制器，ios组件化，利用中介者模式处理组件之间的交互
  - demo示例：

### 备忘录模式
- 主要思想：
  - 在不破坏封装的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态，这样可以在以后将对象恢复到原先保存的状态。
  - 提供了一种状态恢复的实现机制，使用户可以方便的回到一个特定的历史步骤，当新的状态无效或者存在问题时，可以使用暂时存储起来的备忘录恢复状态
- 组成：
  - 原发器(Originator):可以生成自身状态的快照（备忘录），也可以在需要时通过快照恢复自身状态
  - 备忘录（Memento）：是原发器状态快照的值对象，存储原发器的内部状态，通常将备忘录设置为不可变的，并通过构造函数一次性传递数据
  - 负责人（Caretaker）：负责人通过保存备忘录栈来记录原发器的历史状态。 负责保存备忘录，但是不能对备忘录的内容进行操作或检查。只负责存储备忘录对象，不能修改对象，也无须知道对象的实现细节。
- 使用场景： 
   - 保存一个对象在某一个时刻的全部状态或者部分状态，以后需要时可以恢复到先前的状态，实现撤销操作
   - 防止外界对象破坏一个对象历史状态的封装性，避免将对象历史状态的实现细节暴露给外界对象
- 应用示例：
  - ios中的应用实例：CocoaTouch框架（Foundation和UIKit框架）归档解档，属性列表序列化（实现NSCoding协议）
  - demo示例：
 
 
### 观察者模式
- 当对象间存在一对多关系时，则使用观察者模式。当一个对象被修改时，会自动通知依赖它的对象。观察者模式中有两个主要角色Subject和观察者Observer
- 观察者模式通常需要在Subject类中维护一个Observer观察者数组，只要Subject类中有一些事件变化就可以通知所有的观察者并执行相应逻辑
- 使用场景
  - 一个对象的改变将导致其他一个或多个对象发生改变，而不知道具体有多少对象将发生改变，可以降低对象之间的耦合度
  - 一个对象必须通知其他对象，而并不知道这些对象是谁
  - 为一些关键节点（比如View的生命周期）定义通知，当这些关键节点产生变化时通知对应的观察者，相比代理可以降低对象之间的耦合度

### 状态模式
- 主要思想：
  - 在不破坏封装的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态，这样可以在以后将对象恢复到原先保存的状态。
  - 提供了一种状态恢复的实现机制，使用户可以方便的回到一个特定的历史步骤，当新的状态无效或者存在问题时，可以使用暂时存储起来的备忘录恢复状态
- 组成：
  - 原发器(Originator):可以生成自身状态的快照（备忘录），也可以在需要时通过快照恢复自身状态
  - 备忘录（Memento）：是原发器状态快照的值对象，存储原发器的内部状态，通常将备忘录设置为不可变的，并通过构造函数一次性传递数据
  - 负责人（Caretaker）：负责人通过保存备忘录栈来记录原发器的历史状态。 负责保存备忘录，但是不能对备忘录的内容进行操作或检查。只负责存储备忘录对象，不能修改对象，也无须知道对象的实现细节。
- 使用场景： 
   - 保存一个对象在某一个时刻的全部状态或者部分状态，以后需要时可以恢复到先前的状态，实现撤销操作
   - 防止外界对象破坏一个对象历史状态的封装性，避免将对象历史状态的实现细节暴露给外界对象
- 应用示例：
  - ios中的应用实例：CocoaTouch框架（Foundation和UIKit框架）归档解档，属性列表序列化（实现NSCoding协议）
  - demo示例：
 
 
### 策略模式
- 主要思想：
  - 在不破坏封装的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态，这样可以在以后将对象恢复到原先保存的状态。
  - 提供了一种状态恢复的实现机制，使用户可以方便的回到一个特定的历史步骤，当新的状态无效或者存在问题时，可以使用暂时存储起来的备忘录恢复状态
- 组成：
  - 原发器(Originator):可以生成自身状态的快照（备忘录），也可以在需要时通过快照恢复自身状态
  - 备忘录（Memento）：是原发器状态快照的值对象，存储原发器的内部状态，通常将备忘录设置为不可变的，并通过构造函数一次性传递数据
  - 负责人（Caretaker）：负责人通过保存备忘录栈来记录原发器的历史状态。 负责保存备忘录，但是不能对备忘录的内容进行操作或检查。只负责存储备忘录对象，不能修改对象，也无须知道对象的实现细节。
- 使用场景： 
   - 保存一个对象在某一个时刻的全部状态或者部分状态，以后需要时可以恢复到先前的状态，实现撤销操作
   - 防止外界对象破坏一个对象历史状态的封装性，避免将对象历史状态的实现细节暴露给外界对象
- 应用示例：
  - ios中的应用实例：CocoaTouch框架（Foundation和UIKit框架）归档解档，属性列表序列化（实现NSCoding协议）
  - demo示例：
  
### 模板方法模式
- 主要思想：
  - 在不破坏封装的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态，这样可以在以后将对象恢复到原先保存的状态。
  - 提供了一种状态恢复的实现机制，使用户可以方便的回到一个特定的历史步骤，当新的状态无效或者存在问题时，可以使用暂时存储起来的备忘录恢复状态
- 组成：
  - 原发器(Originator):可以生成自身状态的快照（备忘录），也可以在需要时通过快照恢复自身状态
  - 备忘录（Memento）：是原发器状态快照的值对象，存储原发器的内部状态，通常将备忘录设置为不可变的，并通过构造函数一次性传递数据
  - 负责人（Caretaker）：负责人通过保存备忘录栈来记录原发器的历史状态。 负责保存备忘录，但是不能对备忘录的内容进行操作或检查。只负责存储备忘录对象，不能修改对象，也无须知道对象的实现细节。
- 使用场景： 
   - 保存一个对象在某一个时刻的全部状态或者部分状态，以后需要时可以恢复到先前的状态，实现撤销操作
   - 防止外界对象破坏一个对象历史状态的封装性，避免将对象历史状态的实现细节暴露给外界对象
- 应用示例：
  - ios中的应用实例：CocoaTouch框架（Foundation和UIKit框架）归档解档，属性列表序列化（实现NSCoding协议）
  - demo示例：
  
### 访问者模式
- 主要思想：
  - 在不破坏封装的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态，这样可以在以后将对象恢复到原先保存的状态。
  - 提供了一种状态恢复的实现机制，使用户可以方便的回到一个特定的历史步骤，当新的状态无效或者存在问题时，可以使用暂时存储起来的备忘录恢复状态
- 组成：
  - 原发器(Originator):可以生成自身状态的快照（备忘录），也可以在需要时通过快照恢复自身状态
  - 备忘录（Memento）：是原发器状态快照的值对象，存储原发器的内部状态，通常将备忘录设置为不可变的，并通过构造函数一次性传递数据
  - 负责人（Caretaker）：负责人通过保存备忘录栈来记录原发器的历史状态。 负责保存备忘录，但是不能对备忘录的内容进行操作或检查。只负责存储备忘录对象，不能修改对象，也无须知道对象的实现细节。
- 使用场景： 
   - 保存一个对象在某一个时刻的全部状态或者部分状态，以后需要时可以恢复到先前的状态，实现撤销操作
   - 防止外界对象破坏一个对象历史状态的封装性，避免将对象历史状态的实现细节暴露给外界对象
- 应用示例：
  - ios中的应用实例：CocoaTouch框架（Foundation和UIKit框架）归档解档，属性列表序列化（实现NSCoding协议）
  - demo示例：
 
