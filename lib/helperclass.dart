import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Modalclass.dart';

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();
  String api_url = "https://data.covid19india.org/state_district_wise.json";

  Future<List<Detail?>?> fetchCovid() async {
    Uri API = Uri.parse(api_url);
    http.Response response = await http.get(API);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<Detail> covidData = iState
          .map(
            (e) => Detail.fromJson(
              data,
              e,
              stateval[iState.indexOf(e)],
            ),
          )
          .toList();
      return covidData;
    } else {
      return null;
    }
  }
}
