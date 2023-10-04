import 'package:flutter/material.dart';

class MyCircularContainer extends StatefulWidget {
  @override
  _MyCircularContainerState createState() => _MyCircularContainerState();
}

class _MyCircularContainerState extends State<MyCircularContainer>
    with TickerProviderStateMixin {
  double scaleFactor = 1.0,
      a = 0.0,b=1.0;
  late AnimationController _controller;
  late AnimationController _controller2;
  late Animation<double> _scalinganimation;
  late Animation<double> _opacity1;
  bool shouldscale = false;

  @override
  void initState() {
    super.initState();
    _controller2 = AnimationController(
        vsync: this, duration: Duration(seconds: 1));
    _opacity1=Tween(begin: 1.0,end: 0.0).animate(_controller2);
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        shouldscale = true;
      });
      // code to be executed after 2 seconds
      //animation conroller
      _controller = AnimationController(
          vsync: this, duration: Duration(seconds: 2, milliseconds: 100))
        ..forward();

      _scalinganimation = Tween(begin: 0.0, end: 0.3).animate(CurvedAnimation(
          parent: _controller, curve: Curves.fastLinearToSlowEaseIn));




      _controller.addListener(() {
        setState(() {});
      });

      Future.delayed(Duration(seconds: 1,milliseconds: 700), () {
        setState(() {
          a = 2.0;
        });
      });
      Future.delayed(Duration(seconds: 3,milliseconds: 500), () {
        setState(() {
          _controller2.forward();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: FadeTransition(
        opacity: _opacity1,
        child: Center(
          child: AnimatedScale(
            curve: Curves.fastLinearToSlowEaseIn,
            scale: shouldscale ? _scalinganimation.value + a : 0.0,
            duration: Duration(seconds: 1),
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple[200],
              ),
              // Add your content inside the circular container
            ),
          ),
        ),
      ),
    );
  }
}
