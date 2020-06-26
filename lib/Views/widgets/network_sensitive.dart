import 'package:covid_nepal_data/Data/connectivity.dart';
import 'package:covid_nepal_data/Network/connectivity_service.dart';
import 'package:covid_nepal_data/Views/widgets/loader.dart';
import 'package:flutter/material.dart';

class NetworkSensitive extends StatelessWidget {
  final Widget child;

  const NetworkSensitive({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityStatus>(
      stream: ConnectivityService().connectionStateController.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var status = snapshot.data;
          if (status == ConnectivityStatus.offline) {
            return Image.asset('assets/noInternet.png');
          }
          return child;
        } else if (snapshot.hasError) {
          return Text('Something went wrong');
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomLoader(),
            ],
          );
        }
      },
    );
  }
}
