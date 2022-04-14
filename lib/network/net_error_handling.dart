import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:gurulugomi_clone/network/net_exception.dart';

class NetworkErrorHandler {
  static NetException? handleError(http.Response response,
      {required List<int> ignoreCodes}) {
    log("NetworkErrorHanlder ${response.statusCode}");
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return null;
    }

    NetException errorMessage;
    try {
      if (response.statusCode == 503) {
        errorMessage = NetException(code: 503, messageId: '', message: '');
        errorMessage.messageId = CommonMessageId.SERVICE_UNAVAILABLE;
        errorMessage.message = CommonMessages.SERVER_UNDER_MAINTENANCE;
      } else if (response.statusCode == 401) {
        errorMessage = NetException(
          code: 401,
          message: '',
          messageId: '',
        );
        errorMessage.messageId = CommonMessageId.UNAUTHORIZED;
        errorMessage.message = CommonMessages.UNAUTHORIZED_ACCESS;
      } else if (response.statusCode == 404) {
        errorMessage = NetException(code: 404, message: '', messageId: '');
        errorMessage.messageId = CommonMessageId.NOT_FOUND;
        errorMessage.message = CommonMessages.ENDPOINT_NOT_FOUND;
      } else {
        errorMessage = netExceptionFromJson(response.body);
      }
    } catch (e) {
      errorMessage = NetException(code: 0, message: '', messageId: '');
      errorMessage.messageId = CommonMessageId.SOMETHING_WENT_WRONG;
      errorMessage.message = CommonMessages.WENT_WRONG;
    }

    log("err ${errorMessage.message}");
    return errorMessage;
  }
}
