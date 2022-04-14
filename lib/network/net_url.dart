class Endpoint {
  String url;
  Map pathParams = <String, String>{};

  Endpoint(this.url, {this.pathParams = const {}});

  /// Replace URL's path param place holders with values.
  String getUrl() {
    var _url = url;
    pathParams.forEach((key, value) {
      _url = _url.replaceAll("{" + key + "}", value);
    });
    return _url;
  }
}