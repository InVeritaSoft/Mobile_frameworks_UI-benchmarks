import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_dart/math/mat2d.dart';
import 'package:flutter/material.dart';
import 'all_files.g.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Flare Demo',
      home: MyHomePage(title: 'Flutter Flare  Demo'),
    );
  }
}


class MyHomePage extends StatelessWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.builder(
            itemCount: flaresFiles.length,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
            itemBuilder: (context, index) {
              var assetName = flaresFiles[index];
              return FlareItem(assetName: assetName,);
            }
        )
    );
  }
}

class FlareItem extends StatefulWidget {

  final String assetName;

  const FlareItem({Key key,@required this.assetName}) : super(key: key);

  @override
  _FlareItemState createState() => _FlareItemState();

}

class _FlareItemState extends State<FlareItem>  with FlareController {

  final double _animationAmount = 0.5;
  double _animationTime = 0.0;
  final bool _isPaused = false;
  ActorAnimation _animation;

  @override
  void initialize(FlutterActorArtboard artboard) {
    _animation = artboard.getAnimation("Animations");
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    _animationTime += elapsed;
    if(_animationTime >= _animation.duration){
      _animationTime = 0.0;
    }
    //var animationTime =  _animationTime % _animation.duration;
    _animation.apply(_animationTime, artboard, _animationAmount);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FlareActor(
        widget.assetName,
        animation: "Animations",
        isPaused: _isPaused,
        controller: this
    );
  }
}



