import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

part 'network_response.dart';

class NetworkClient {
  final VoidCallback onUnAuthorize;
  final VoidCallback onSocketException;
  final Map<String, String> Function() commonHeader;

  final Logger _logger = Logger();
  final String defaultErrorMessage = 'Something went wrong';

  NetworkClient({
    required this.onSocketException,
    required this.onUnAuthorize,
    required this.commonHeader,
  });

  Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      _logPreRequest(url);

      Response response = await get(uri, headers: commonHeader());
      return _handleResponse(response, url);
    } on SocketException {
      return _handleSocketException();
    } catch (e) {
      return _handleGenericException(e);
    }
  }

  Future<NetworkResponse> postRequest({
    required String url,
    required Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _logPreRequest(url, body: body);

      Response response = await post(
        uri,
        headers: commonHeader(),
        body: jsonEncode(body),
      );
      return _handleResponse(response, url);
    } on SocketException {
      return _handleSocketException();
    } catch (e) {
      return _handleGenericException(e);
    }
  }

  Future<NetworkResponse> putRequest({
    required String url,
    required Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _logPreRequest(url, body: body);

      Response response = await put(
        uri,
        headers: commonHeader(),
        body: jsonEncode(body),
      );
      return _handleResponse(response, url);
    } on SocketException {
      return _handleSocketException();
    } catch (e) {
      return _handleGenericException(e);
    }
  }

  Future<NetworkResponse> patchRequest({
    required String url,
    required Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _logPreRequest(url, body: body);

      Response response = await patch(
        uri,
        headers: commonHeader(),
        body: jsonEncode(body),
      );
      return _handleResponse(response, url);
    } on SocketException {
      return _handleSocketException();
    } catch (e) {
      return _handleGenericException(e);
    }
  }

  Future<NetworkResponse> deleteRequest({
    required String url,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _logPreRequest(url);

      Response response = await delete(uri, headers: commonHeader());
      return _handleResponse(response, url);
    } on SocketException {
      return _handleSocketException();
    } catch (e) {
      return _handleGenericException(e);
    }
  }


  void _logPreRequest(String url, {Map<String, dynamic>? body}) {
    _logger.i('''
🔵 PRE REQUEST:
URL: $url
HEADERS: ${commonHeader()}
BODY: ${body != null ? jsonEncode(body) : 'null'}
''');
  }

  NetworkResponse _handleResponse(Response response, String url) {
    _logger.i('''
🟢 RESPONSE:
URL: $url
STATUS: ${response.statusCode}
BODY: ${response.body}
''');

    final int status = response.statusCode;

    if (status == 200 || status == 201) {
      final data = jsonDecode(response.body);
      return NetworkResponse(
        isSuccess: true,
        statusCode: status,
        responseBody: data,
      );
    } else if (status == 401 || status == 402 || status == 403) {
      _logger.e('Unauthorized response: ${response.body}');
      onUnAuthorize();
      return NetworkResponse(
        isSuccess: false,
        statusCode: status,
        errorMessage: defaultErrorMessage,
      );
    } else {
      try {
        final errorData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: status,
          errorMessage: errorData['msg'] ?? defaultErrorMessage,
        );
      } catch (_) {
        return NetworkResponse(
          isSuccess: false,
          statusCode: status,
          errorMessage: defaultErrorMessage,
        );
      }
    }
  }

  NetworkResponse _handleSocketException() {
    onSocketException();
    return NetworkResponse(
      isSuccess: false,
      statusCode: -1,
      errorMessage: 'Check your network connection and try again later',
    );
  }

  NetworkResponse _handleGenericException(Object e) {
    _logger.e('Exception: $e');
    return NetworkResponse(
      isSuccess: false,
      statusCode: -1,
      errorMessage: e.toString(),
    );
  }
}
