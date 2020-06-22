import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void didChangeDependencies() {
    var height  = MediaQuery.of(context).size.width/10;
    var width = height;
    for (var index = 0; index  < 10; index++) {
      precacheImage( Image.asset(
        GridRotareItem.getImage(index),
        height: height,
        width: width,
        cacheHeight: height.floor(),
        cacheWidth: width.floor(),
        fit: BoxFit.cover,
      ).image, context);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
            itemCount: 200,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
            itemBuilder: (context, index) {
              var animateIndex = index % 3;
              if(animateIndex == 0 ){
                return GridRotareItem(index: index,);
              }
              if(animateIndex == 1 ){
                return GridFadeItem(index: index,);
              }
              return GridScaleItem(index: index,);
            }
        )
    );
  }
}

class GridRotareItem extends StatefulWidget {

  final int index;

  const GridRotareItem({Key key, this.index}) : super(key: key);

  @override
  _GridRotareItemState createState() => _GridRotareItemState();

  static getImage(index){
    var  url  = 'assets/images/${index % 20}.jpeg';
    return url;
  }

}

class _GridRotareItemState extends State<GridRotareItem> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  double height;
  double width;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 5),
    );
    animationController.repeat();
  }

  @override
  void didChangeDependencies() {
    height  = MediaQuery.of(context).size.width/10;
    width = height;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(animationController),
      child: Image.asset(
        GridRotareItem.getImage(widget.index),
        height: height,
        width: width,
        cacheHeight: height.floor(),
        cacheWidth: width.floor(),
        fit: BoxFit.cover,
      ),
    );
  }
}




class GridFadeItem extends StatefulWidget {

  final int index;

  const GridFadeItem({Key key, this.index}) : super(key: key);

  @override
  _GridFadeItemState createState() => _GridFadeItemState();

  static getImage(index){
    var  url  = 'assets/images/${index % 20}.jpeg';
    return url;
  }

}

class _GridFadeItemState extends State<GridFadeItem> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  double height;
  double width;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 5),
    );
    animationController.repeat();
  }

  @override
  void didChangeDependencies() {
    height  = MediaQuery.of(context).size.width/10;
    width = height;
    super.didChangeDependencies();
  }


  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween(begin: 0.0, end: 1.0).animate(animationController),
      child: Image.asset(
        GridFadeItem.getImage(widget.index),
        height: height,
        width: width,
        cacheHeight: height.floor(),
        cacheWidth: width.floor(),
        fit: BoxFit.cover,
      ),
    );
  }
}

class GridScaleItem extends StatefulWidget {

  final int index;

  const GridScaleItem({Key key, this.index}) : super(key: key);

  @override
  _GridScaleItemState createState() => _GridScaleItemState();

  static getImage(index){
    var  url  = 'assets/images/${index % 20}.jpeg';
    return url;
  }

}

class _GridScaleItemState extends State<GridScaleItem> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  double height;
  double width;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 5),
    );
    animationController.repeat();
  }

  @override
  void didChangeDependencies() {
    height  = MediaQuery.of(context).size.width/10;
    width = height;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(begin: 0.0, end: 1.0).animate(animationController),
      child: Image.asset(
        GridScaleItem.getImage(widget.index),
        height: width,
        width: height,
        cacheHeight: height.floor(),
        cacheWidth: width.floor(),
        fit: BoxFit.cover,
      ),
    );
  }
}




