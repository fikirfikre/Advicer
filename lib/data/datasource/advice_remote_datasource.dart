import 'dart:convert';

import 'package:advicer/data/Exception/exception.dart';
import 'package:advicer/data/models/advicer_model.dart';
import 'package:http/http.dart' as http;

abstract class AdvicerRemoteDatasource {
  Future<AdvicerModel> getAdviceFromApi();
}

class AdvicerRemoteDatasourceImpl extends AdvicerRemoteDatasource {
  AdvicerRemoteDatasourceImpl({required this.client});
  final  http.Client client;
  @override
  Future<AdvicerModel> getAdviceFromApi() async {
    final response = await client.get(
        Uri.parse("https://api.flutter-community.com/api/v1/advice"),
        headers: {'content-type': 'application/json'});
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final body = json.decode(response.body);
      return AdvicerModel.fromJson(body);
    }
  }
}
