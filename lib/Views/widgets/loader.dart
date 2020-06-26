import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / 2.5,
      width: MediaQuery.of(context).size.width / 2.5,
      child: FlareActor(
        'assets/Progress Indicator.flr',
        animation: 'progress',
        alignment: Alignment.center,
        fit: BoxFit.contain,
      ),
    );
  }
}
