import 'package:dio/dio.dart';

extension RequestOptionsExt on  RequestOptions{

  /// мапит [RequestOptions] в [Options]
  Options toOptions() =>  Options(
    method: this.method,
    sendTimeout: this.sendTimeout,
    receiveTimeout: this.receiveTimeout,
    extra: this.extra,
    headers: this.headers,
    responseType: this.responseType,
    contentType: this.contentType,
    validateStatus: this.validateStatus,
    receiveDataWhenStatusError: this.receiveDataWhenStatusError,
    followRedirects: this.followRedirects,
    maxRedirects: this.maxRedirects,
    requestEncoder: this.requestEncoder,
    responseDecoder: this.responseDecoder,
    listFormat: this.listFormat,
  );

}