import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'api_exception.dart';

const String jsonContentType = 'application/json';

class ApiManager {
  var logger = Logger();
  var _errorMessage = "";

  String get errorMessage => _errorMessage;
  Future<dynamic> get(
    String url, {
    String contentType = jsonContentType,
  }) async {
    try {
      Map<String, String> headers = {
        'Content-Type': contentType,
        'Access-Control-Allow-Origin': "*",
        'Accept': '*/*',
      };

      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      var responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> put(String url, var parameters,
      {String contentType = jsonContentType}) async {
    try {
      Map<String, String> headers = {'Content-Type': contentType};

      final response = await http.put(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(parameters),
      );

      log('Response body of Put ${response.request!.url} -> ${response.body}');

      var responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> patch(
    String url,
    var parameters, {
    String contentType = jsonContentType,
  }) async {
    try {
      Map<String, String> headers = {'Content-Type': contentType};

      final response = await http.patch(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(parameters),
      );

      log('Response body of Patch ${response.request!.url} -> ${response.body}');

      var responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> delete(String url,
      {String contentType = jsonContentType}) async {
    try {
      Map<String, String> headers = {
        'Content-Type': contentType,
      };
      final response = await http.delete(
        Uri.parse(url),
        headers: headers,
      );
      log('Response body of Delete ${response.request!.url} -> ${response.body}');
      var responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> deleteURL(
    String url, {
    String contentType = jsonContentType,
  }) async {
    try {
      Map<String, String> headers = {'Content-Type': contentType};

      final response = await http.delete(
        Uri.parse(url),
        headers: headers,
      );

      log('Response body of Delete ${response.request!.url} -> ${response.body}  ${response.statusCode}');

      var responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> post(String url, var parameters,
      {String contentType = jsonContentType}) async {
    try {
      Map<String, String> headers = {
        'Content-Type': contentType,
        'Access-Control-Allow-Origin': "*",
        'Accept': '*/*',
      };
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(parameters),
      );

      var responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> putMultipart({
    required String url,
    required Map<String, String> parameters,
    required List<http.MultipartFile> imageFiles,
    String contentType = jsonContentType,
  }) async {
    try {
      var request = http.MultipartRequest('PUT', Uri.parse(url));

      request.files.addAll(imageFiles);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var data = {"statusCode": 200, "message": "File uploaded successfully"};

        return _returnResponse(http.Response(json.encode(data), 200));
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body);
        var response1 = "success";
        if (responseJson['success'] == false) {
          throw BadRequestException(
            'Err:${response.statusCode} ${responseJson['message']}',
            responseJson,
          );
        }
        return responseJson;
      case 204:
        var responseJson = json.decode(response.body);
        logger.e("Err:${response.statusCode} $responseJson");

        if (responseJson['status'] == false) {
          throw BadRequestException(
            'Err:${response.statusCode} ${responseJson['message']}',
            responseJson,
          );
        }
        return responseJson;
      case 400:
        Map<String, dynamic> errorMap = json.decode(response.body);
        String errorMessage = errorMap['error'];
        logger.e("Err:${response.statusCode} ${response.body}");
        print("${errorMap}.........errorMap.......");
        throw BadRequestException(
          'Err:${response.statusCode} $errorMessage',
          errorMap,
        );

      case 401:
        var responseJson = "unauthorized";
        logger.e(responseJson);
        if (response.statusCode.toInt() != 401) {
          throw BadRequestException(
            'Err:${response.statusCode} "unauthorzied',
            responseJson,
          );
        }

        return responseJson;
      case 403:
      case 404:
      case 409:
      case 500:
      case 502:
    }
  }
}
