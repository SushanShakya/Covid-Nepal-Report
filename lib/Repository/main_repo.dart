import 'package:covid_nepal_data/Models/summary.dart';
import 'package:covid_nepal_data/Network/api.dart';

class Repository {
  CovidApi api = CovidApi();

  Future<SummaryModel> allcases() => api.summaryCases();

  Future<GlobalCases> globalCases() => api.globalCases();

  Future<List<CountryCases>> countryCases() => api.countryCases();
}