import 'package:flutter/material.dart';

class Animatedcircle extends StatefulWidget {
  const Animatedcircle({Key? key}) : super(key: key);

  @override
  State<Animatedcircle> createState() => _AnimatedcircleState();
}

class _AnimatedcircleState extends State<Animatedcircle>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _radiusAnimation;
  late Animation<double> _scaleAnimation;
  @override
  void initState() {
    super.initState();
    //animation conroller
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2,milliseconds: 100))
          ..forward();

    //rotation animation
    _rotationAnimation = Tween(begin: 0.0, end: 6.28)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    //radius animation
    _radiusAnimation = Tween(begin: 450.0, end: 10.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    //scaleAnimation
    _scaleAnimation = Tween(begin: 255.0, end: 100.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));




    _controller.addListener(() {
      setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.forward();
        //a=100;
      }
      /*else if(status==AnimationStatus.dismissed) {
        _controller.forward();
      }*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _rotationAnimation.value,
      child: Container(
        width: 255,
        height: _scaleAnimation.value,
        decoration: BoxDecoration(
          color: Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(_radiusAnimation.value),
        ),
      ),
    );
  }
}
