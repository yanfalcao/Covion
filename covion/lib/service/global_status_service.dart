import 'dart:async';
import 'dart:convert';

import 'package:covion/model/status_global.dart';
import 'package:http/http.dart' as  http;

class StatusGlobalService {
  final String baseUrl = "https://thevirustracker.com/free-api?global=stats";

  Future<StatusGlobal> fetchStatus() async {
    var response = await http.get('$baseUrl');

    if(response.statusCode == 200)
      return _getTypesNoticesList(jsonDecode(response.body));
    return StatusGlobal();
  }
}

StatusGlobal _getTypesNoticesList(Map json){
  StatusGlobal types = StatusGlobal();

  var jsonResult = json['results'] as List;
  types = StatusGlobal.fromJson(jsonResult[0]);

  return types;
}