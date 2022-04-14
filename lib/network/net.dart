import 'dart:convert';
import 'dart:math';
import 'dart:developer' as dev;
import 'net_event_handler.dart';
import 'net_result.dart';
import 'net_url.dart';
import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
enum HttpMethod { GET, POST, DELETE, PUT }

class Net {
  static NetEventHandler netEventHandler = NetEventHandler();
  static Map<String, dynamic> configs = {"logging": true};
  String id;
  Endpoint endPoint;
  Map<String, String> queryParams = {};
  //Map<String, String> pathParams = {};
  Map<String, String> headers = {};
  Map<String, String> extra = {};
  List forceDispatchErrorCodes = <int>[];
  dynamic requestBody;
  HttpMethod method;

  Net(this.method, this.endPoint,
      {this.queryParams = const {},
      this.requestBody,
      this.headers = const {},
      this.forceDispatchErrorCodes = const [],
      this.extra = const {}})
      : id = '${Random().nextInt(100000) + 100000}';

// perform()
  Future<NetResult> perform() async {
    http.Response response;
    netEventHandler.preRequest(this);
    log('http [$id] request - $method : ${_getUri()} | body: $requestBody | headers : $headers');
    try {
      switch (method) {
        case HttpMethod.GET:
          response = await get();
          break;
        case HttpMethod.POST:
          response = await post();
          break;
        case HttpMethod.DELETE:
          response = await delete();
          break;
        case HttpMethod.PUT:
          response = await put();
          break;
      }
    } catch (error) {
      log('http [$id] response - $method : ${_getUri()} | error : ${error.toString()}');
      return NetResult(this, error.toString(), -999, {});
    }
    netEventHandler.postRequest(this, response);
    log('http [$id] response - $method : ${_getUri()} | status: ${response.statusCode} | body : ${response.body}');
    return NetResult(
        this, response.body, response.statusCode, response.headers);
  }

// get request.............
  Future<http.Response> get() async {
    final response = await http.get(_getUri(), headers: headers);
    return response;
  }

// Post Request....................

  Future<http.Response> post() async {
    final response = await http.post(
      _getUri(),
      headers: headers,
      body: requestBody == null ? "" : jsonEncode(requestBody),
    );

    return response;
  }

// Delete Request..........................
  Future<http.Response> delete() async {
    final response = await http.delete(
      _getUri(),
      headers: headers,
      body: requestBody == null ? "" : jsonEncode(requestBody),
    );

    return response;
  }

// Put Request...........................
  Future<http.Response> put() async {
    final response = await http.put(
      _getUri(),
      headers: headers,
      body: requestBody == null ? "" : jsonEncode(requestBody),
    );
    return response;
  }

  Uri _getUri() {
    return Uri.parse(endPoint.getUrl()).replace(queryParameters: queryParams);
  }

  void log(String message) {
    if (configs['logging'] ?? false) dev.log(message);
  }
}

//class Endpoint {}
