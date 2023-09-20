import 'package:flutter/material.dart';

class Animatedcircle extends StatefulWidget {
  const Animatedcircle({Key? key}) : super(key: key);

  @override
  State<Animatedcircle> createState() => _AnimatedcircleState();
}
class _AnimatedcircleState extends State<Animatedcircle>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 1),
  )..repeat(reverse: true,period: Duration(seconds: 2));
  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.easeOut);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _animation,
        child: Container(
          height: 900,
          width: 900,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.deepPurple[50]),
        ),
      ),
    );
  }
}
