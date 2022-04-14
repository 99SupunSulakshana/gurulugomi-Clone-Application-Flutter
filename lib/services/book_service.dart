// // ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable, unnecessary_null_comparison, avoid_print

// import 'dart:html';
// import 'dart:io';
// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';

// import 'package:http/http.dart' as http;

// import 'package:gurulugomi_clone/network/net_base.dart';

// class HTTpClient {
//   static final HttpClient _singleton = HttpClient();
//   static HttpClient get instance => _singleton;

//   Future<dynamic> fetchData(String url,
//       {required Map<String, String> params}) async {
//     var responseJason;
//     var uri = APIBase.baseURL +
//         url +
//         ({params != null} ? this.queryParameters(params) : "");
//     var header = {Headers.contentTypeHeader: "appilication/json"};
//     try {
//       final response = await http.get(uri, headers: header);
//       print(response.body.toString());
//       responseJson = _returnResponse(respose);
//     } on SocketException {
//       throw FetchDataException('No Internet Connection');
//     }
//     return responseJson;
    
//   }
// }
