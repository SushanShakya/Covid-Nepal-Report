import 'package:covid_nepal_data/Network/api.dart';
import 'package:covid_nepal_data/Views/country_view.dart';
import 'package:covid_nepal_data/Views/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(CovidTracker());

class CovidTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // CovidApi().globalCases();
    return MaterialApp(
      home: CountryView(),
    );
  }
}
