import 'dart:async';

import 'package:covid_nepal_data/Models/summary.dart';
import 'package:covid_nepal_data/Repository/main_repo.dart';

class GlobalBloc {
  final Repository repo = Repository();
  final _globalCasesFetcher = StreamController<GlobalCases>();

  Stream<GlobalCases> get globalCaseData => _globalCasesFetcher.stream;

  fetchGlobalData() async{
    GlobalCases cases = await repo.globalCases();
    _globalCasesFetcher.sink.add(cases);
  }

  dispose() {
    _globalCasesFetcher.close();
  }
}

final bloc = GlobalBloc();