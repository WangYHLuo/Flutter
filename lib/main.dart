import 'package:flutter/material.dart';

//void main() => runApp(MyApp()); //程序入口
void main() {
  runApp(new MaterialApp(
    title: 'Shopping App',
//    home: new ShoppingList(
//      products: <Product>[
//        new Product(name: '苹果'),
//        new Product(name: '桃子'),
//        new Product(name: '瓜子'),
//        new Product(name: '西瓜'),
//        new Product(name: '香蕉'),
//      ],
//    ),
    home: new TabbedAppBarSample(),
  ));
}

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  // widget 子类中的字段往往都会定义成"final"
  final Widget title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 100.0, //单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
      padding: const EdgeInsets.symmetric(horizontal: 8.0), // 创建水平垂直或水平偏移的插图
      decoration: new BoxDecoration(color: Colors.blue[500]), //设置背景
      //Row 是水平方向的线性布局（linear layout）
      child: new Row(
        //列表项的类型是<widget>
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ), //null 会禁用button
          new Expanded(
            child: title, // 设置名称
          ),
          new IconButton(
              icon: new Icon(Icons.search),
              tooltip: 'Search', //描述按下按钮时将发生的操作的文本。当用户长按按钮并且用于辅助功能时，将显示此文本。
              onPressed: null)
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // Material 是一张UI纸
    return new Material(
      //
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
              child: new Center(
            child: new Text('hello world'),
          ))
        ],
      ),
    );
  }
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null),
        title: new Text('Example2 title'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
      //body 占屏幕的大部分
      body: new Center(
        child: new Text('Hello world!'),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add',
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // 创建一个检测手势的小部件
    return new GestureDetector(
      onTap: () {
        print('点击button!');
      },
      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child: new Text('Engage'),
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _CounterState();
  }
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      children: <Widget>[
        new CounterIncrementor(onPressed: _increment),
        new CounterDisplay(
          count: _counter,
        )
      ],
    );
  }
}

class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Text('Count: $count');
  }
}

class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new RaisedButton(
      onPressed: onPressed,
      child: new Text('Increment'),
    );
  }
}

//class Product {
//  const Product({this.name});
//
//  final String name;
//}
//
//typedef void CartChangedCallback(Product product, bool inCart);
//
//class ShoppingListItem extends StatelessWidget {
//  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
//      : product = product,
//        super(key: new ObjectKey(product));
//
//  final Product product;
//  final bool inCart;
//  final CartChangedCallback onCartChanged;
//
//  Color _getColor(BuildContext context) {
//    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
//  }
//
//  TextStyle _getTextStyle(BuildContext context) {
//    if (!inCart) return null;
//
//    return new TextStyle(
//      color: Colors.black54,
//      decoration: TextDecoration.lineThrough,
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new ListTile(
//      onTap: () {
//        onCartChanged(product, !inCart);
//      },
//      leading: new CircleAvatar(
//        backgroundColor: _getColor(context),
//        child: new Text(product.name[0]),
//      ),
//      title: new Text(
//        product.name,
//        style: _getTextStyle(context),
//      ),
//    );
//  }
//}
//
//class ShoppingList extends StatefulWidget {
//  //  这个widget 可以存储状态，shoppingList 首次插入到树中时，框架会调用createState函数，
//  //  创建一个新的 _shoppingListState实例来与该树中的相应位置关联（我们通常命名State
//  //  子类时候会带一个下划线，这表示其是私有的）。当这个widget的父级将创建一个新的ShoppingList实例
//  //  但是Flutter 框架将重用已经在树中的_ShoppingListState实例，而不是再次调用createState
//  //  创建一个新的实例，
//
//  //  要访问当前的ShoppingList的属性，_ShoppingListState可以使用它的widget属性，
//  //  如果父级重建并创建一个新的ShoppingList,那么_ShoppingListState也将用新的widget值重建
//  //  （：这里原文档有错误，应该是_ShoppingListState不会重新构建，
//  //  但其widget的属性会更新为新构建的widget）
//  //  如果希望widget属性更改的时候收到通知，则可以覆盖didUpdateWidget函数，
//  //  以便将旧的oldWidget与当前widget进行比较
//  final List<Product> products;
//
//  const ShoppingList({Key key, this.products}) : super(key: key);
//
//  @override
//  _ShoppingListState createState() => new _ShoppingListState();
//// _ShoppingListState不会重新构建，但其widget
//
//}
//
//class _ShoppingListState extends State<ShoppingList> {
//  Set<Product> _shoppingCart = new Set<Product>();
//
//  void _handleCartChanged(Product product, bool inCart) {
//    setState(() {
//      if (inCart)
//        _shoppingCart.add(product);
//      else
//        _shoppingCart.remove(product);
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('Shopping List'),
//      ),
//      body: new ListView(
//        padding: new EdgeInsets.symmetric(vertical: 8.0),
//        children: widget.products.map((Product product) {
//          return new ShoppingListItem(
//            product: product,
//            inCart: _shoppingCart.contains(product),
//            onCartChanged: _handleCartChanged,
//          );
//        }).toList(),
//      ),
//    );
//  }
//}

//AppBar 基础

class BasicAppBarSample extends StatefulWidget {
  //这个应用程序是有状态的，它跟踪用户当前的选择
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _BasicAppBarSampleState();
  }

// 上面的写法和下面这个写法一样的
//  @override
//  _BasicAppBarSampleState createState() => new _BasicAppBarSampleState();
}

class _BasicAppBarSampleState extends State<BasicAppBarSample> {
  Choice _selectedChoice = choices[0]; // the app's state

  void _select(Choice choice) {
    setState(() {
      //Causes the app to rebuild with the new _selectedChoice.
      //使用新的_selectedChoice使应用程序重建
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        // 实例新的脚手架
        appBar: new AppBar(
          title: const Text('Base appTitle'),
          actions: <Widget>[
            // 操作动作
            new IconButton(
                // 第一个动作
                icon: Icon(choices[0].icon),
                onPressed: () {
                  _select(choices[0]);
                }),
            new IconButton(
                icon: Icon(choices[1].icon),
                onPressed: () {
                  _select(choices[1]);
                }),
            new PopupMenuButton<Choice>(
                //溢出菜单
                onSelected: _select,
                itemBuilder: (BuildContext context) {
                  return choices.skip(2).map((Choice choice) {
                    return new PopupMenuItem<Choice>(
                      value: choice,
                      child: new Text(choice.title),
                    );
                  }).toList();
                }),
          ],
        ),
        body: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new ChoiceCart(choice: _selectedChoice),
        ),
      ),
    );
  }
}

//定义模型
class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

//定义数据
const List<Choice> choices = const <Choice>[
  const Choice(title: '汽车', icon: Icons.directions_car),
  const Choice(title: '自行车', icon: Icons.directions_bike),
  const Choice(title: '船', icon: Icons.directions_boat),
  const Choice(title: '公车', icon: Icons.directions_bus),
  const Choice(title: '火车', icon: Icons.directions_railway),
  const Choice(title: '步行', icon: Icons.directions_walk),
];

// 定义显示
class ChoiceCart extends StatelessWidget {
  const ChoiceCart({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          // 定义显示方向，（如同Android 的线性布局）
          mainAxisSize: MainAxisSize.min, // 主轴尺寸
          crossAxisAlignment: CrossAxisAlignment.center, // 交叉轴对齐
          children: <Widget>[
            // 子布局 中的子布局
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

// 选项卡TabBar

class TabbedAppBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new DefaultTabController(
          length: myList.length,
          child: new Scaffold(
            appBar: new AppBar(
              title: const Text('Tabbed AppBar'),
              bottom: new TabBar(
                isScrollable: true, // 是否滑动
                tabs: myList.map((Models models) {
                  return new Tab(
                    text: models.title,
                    icon: new Icon(models.icon),
                  );
                }).toList(),
              ),
            ),
            body: new TabBarView(
                children: myList.map((Models models) {
              return new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new TabChoiceCard(
                  models: models,
                ),
              );
            }).toList()),
          )),
    );
  }
}

//定义数据
const List<Models> myList = const <Models>[
  const Models(title: '汽车', icon: Icons.directions_car),
  const Models(title: '自行车', icon: Icons.directions_bike),
  const Models(title: '船', icon: Icons.directions_boat),
  const Models(title: '公车', icon: Icons.directions_bus),
  const Models(title: '火车', icon: Icons.directions_railway),
  const Models(title: '步行', icon: Icons.directions_walk),
];

//定义模型
// ignore: camel_case_types
class Models {
  const Models({this.title, this.icon});

  final String title;
  final IconData icon;
}

class TabChoiceCard extends StatelessWidget {
  final Models models;

  const TabChoiceCard({Key key, this.models}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(
              models.icon,
              size: 128.0,
              color: textStyle.color,
            ),
            new Text(
              models.title,
              style: textStyle,
            )
          ],
        ),
      ),
    );
  }
}

//class _TabbedAppbarSample extends State<TabbedAppBarSample>{
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return null;
//  }
//
//}

//void main() {
//  runApp(new MaterialApp(
//    title: "My App",
//    home: new MyScaffold,
//  ));
//}

//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or simply save your changes to "hot reload" in a Flutter IDE).
//        // Notice that the counter didn't reset back to zero; the application
//        // is not restarted.
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//          // Column is also layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug painting" (press "p" in the console, choose the
//          // "Toggle Debug Paint" action from the Flutter Inspector in Android
//          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//          // to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
