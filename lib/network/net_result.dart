import 'net.dart';

class NetResult {
  Net net;
  Object responseBody;
  int status;
  Map headers = <String, String>{};

  NetResult(this.net, this.responseBody, this.status, this.headers);

  bool isSucess() {
    return status >= 200 && status < 300;
  }
}
