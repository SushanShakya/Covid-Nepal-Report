import 'package:covid_nepal_data/Bloc/get_bloc.dart';
import 'package:covid_nepal_data/Models/summary.dart';
import 'package:covid_nepal_data/Views/widgets/actor.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

String localeName = Platform.localeName;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    bloc.fetchGlobalData();
    print(localeName);
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        // StreamBuilder<GlobalCases>(
        //   stream: bloc.globalCaseData,
        //   builder: (context, snapshot) {
        //     if(snapshot.hasData) {
        //       return Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget> [
        //         Text("${snapshot.data.totalDeaths}")
        //       ]
        //     );
        //     }else {
        //       return Center(child: CircularProgressIndicator(),);
        //     }

        //   }
        // ),
        Container(
          child: Teddy(
            animation: TeddyAnimation.success,
          ),
        )
      ],
    ));
  }
}
