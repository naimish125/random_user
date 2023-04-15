
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Screens/model/home_model.dart';


class ApiHelper
{

  Future<RandomPerson?> randomPersonApi()
  async {
    Uri apiUri = Uri.parse("https://randomuser.me/api/");
    var response = await http.get(apiUri);
    var randomJson = jsonDecode(response.body);

    return RandomPerson.fromJson(randomJson);
  }

}