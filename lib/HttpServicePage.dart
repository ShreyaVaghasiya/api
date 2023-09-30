import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'UserReaponsepage.dart';
import 'UtilPage.dart';

class HttpService{
  Future getUserResponse() async {
    log("getStateUiResponse | started");
    var url = Uri.parse(
        Utils.BASE_URL);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

    } else {
      print("No Data Found !");
    }
  }
}