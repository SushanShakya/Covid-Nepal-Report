import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Teddy extends StatefulWidget {
  final TeddyAnimation animation;
  final Function onTap;
  final Function onLongPress;

  Teddy({this.animation, this.onTap, this.onLongPress});

  @override
  _TeddyState createState() => _TeddyState();
}

class _TeddyState extends State<Teddy> {

  @override
  Widget build(BuildContext context) {
    TeddyAnimation animation = widget.animation;
    return SizedBox(
      height: MediaQuery.of(context).size.width / 1.5,
      width: MediaQuery.of(context).size.width / 2,
      child: GestureDetector(
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        onDoubleTap: widget.onLongPress,
        child: FlareActor(
          'assets/teddy.flr',
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: getAnimation(animation)              
        ),
      ),
    );
  }
}

enum TeddyAnimation { success, fail, idle, fail2 }

String getAnimation(TeddyAnimation animation) {
  if (animation == TeddyAnimation.fail) {
    return "fail";
  } else if (animation == TeddyAnimation.fail2) {
    return "fail2";
  } else if (animation == TeddyAnimation.success) {
    return "success";
  } else {
    return "idle";
  }
}
