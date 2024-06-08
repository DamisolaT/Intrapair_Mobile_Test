import 'dart:convert';
import 'package:http/http.dart' as http;  // Ensure the http package is imported
import 'package:intrapair_task/bloc/country_state.dart';
import 'package:intrapair_task/model/country_model.dart';

class CountryRepository {
  final String _baseUrl = "https://freetestapi.com/api/v1/countries";

  Future<List<CountryState>> getCountries() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      print(response.body);
      var jsonList = jsonDecode(response.body) as List;

      List<CountryState> countryList = [];
      for (var element in jsonList) {
        countryList.add(CountryState.fromJson(element));
      }
      return countryList;
    } else {
      throw Exception('Failed to load countries.');
    }
  }
}