import 'package:covid_nepal_data/Data/constants.dart';
import 'package:covid_nepal_data/Models/summary.dart';
import 'package:http/http.dart' as http;

class CovidApi {
  Future<SummaryModel> summaryCases() async{
    http.Response response = await http.get("$url/summary");

    if (response.statusCode == 200) {
      return summaryModelFromJson(response.body);
    }else{
      throw Exception("Failed to load");
    }
  }

  Future<GlobalCases> globalCases() async{
    http.Response response = await http.get("$url/summary");

    if (response.statusCode == 200) {
      SummaryModel model = summaryModelFromJson(response.body);
      return model.global;
    }else{
      throw Exception("Failed to load");
    }
  }

  Future<List<CountryCases>> countryCases() async{
    http.Response response = await http.get("$url/summary");

    if (response.statusCode == 200) {
      SummaryModel model = summaryModelFromJson(response.body);
      return model.countries;
    }else{
      throw Exception("Failed to load");
    }
  }
}