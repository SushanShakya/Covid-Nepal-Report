import 'dart:async';

import 'package:covid_nepal_data/Models/summary.dart';
import 'package:covid_nepal_data/Repository/main_repo.dart';
import 'package:rxdart/rxdart.dart';

class GlobalBloc {
  final Repository repo = Repository();
  final _globalCasesFetcher = BehaviorSubject<GlobalCases>();

  Stream<GlobalCases> get globalCaseData => _globalCasesFetcher.stream;

  fetchGlobalData() async {
    try {
      GlobalCases cases = await repo.globalCases();
      _globalCasesFetcher.sink.add(cases);
    } catch (e) {
      _globalCasesFetcher.sink.addError(e);
    }
  }

  dispose() {
    _globalCasesFetcher.close();
  }
}

final bloc = GlobalBloc();
