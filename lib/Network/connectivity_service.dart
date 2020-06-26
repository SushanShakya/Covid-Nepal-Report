import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:covid_nepal_data/Data/connectivity.dart';

class ConnectivityService {
  
  StreamController<ConnectivityStatus> connectionStateController = StreamController<ConnectivityStatus>();
  
  ConnectivityService() {

    Connectivity().onConnectivityChanged.listen((ConnectivityResult event) {
      var connectionStatus = _getStatus(event);

      connectionStateController.add(connectionStatus);
    });


  }

  ConnectivityStatus _getStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.wifi;
      case ConnectivityResult.none:
        return ConnectivityStatus.offline;
      default:
        return ConnectivityStatus.offline;
    }
  }

}