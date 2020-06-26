import 'dart:async';

import 'package:covid_nepal_data/Models/summary.dart';
import 'package:covid_nepal_data/Repository/main_repo.dart';
import 'package:rxdart/rxdart.dart';

class LocalBloc {
  final Repository repo = Repository();
  final _localCasesFetcher = BehaviorSubject<CountryCases>();

  Stream<CountryCases> get localCaseData => _localCasesFetcher.stream;

  fetchLocalData() async {
    try {
      List<CountryCases> cases = await repo.countryCases();
      for (int i = 0, n = cases.length; i < n; i++) {
        if (cases[i].countryCode == "NP") {
          _localCasesFetcher.sink.add(cases[i]);
        }
      }
    } catch (e) {
      _localCasesFetcher.addError(e);
    }
  }

  dispose() {
    _localCasesFetcher.close();
  }
}

final localBloc = LocalBloc();
