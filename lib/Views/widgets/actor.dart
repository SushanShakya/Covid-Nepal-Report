import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Teddy extends StatelessWidget {

  final Function onTap;
  final TeddyAnimation animation;

  Teddy({this.onTap, @required this.animation});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / 2,
      width: MediaQuery.of(context).size.width / 2,
      child: InkWell(
        onTap: onTap,
        child: FlareActor(
          'assets/teddy.flr',
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: getAnimation(animation),
        ),
      ),
    );
  }
}

enum TeddyAnimation{
  success,fail,idle,fail2
}

String getAnimation(TeddyAnimation animation) {
  if(animation == TeddyAnimation.fail) {
    return "fail";
  }else if(animation == TeddyAnimation.fail2){
    return "fail2";
  }else if(animation == TeddyAnimation.success){
    return "success";
  }else{
    return "idle";
  }
}