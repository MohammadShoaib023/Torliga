import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:torliga/core/constants/app_end_points.dart';

import '../utils/logger.dart';

class DioInterceptor extends Interceptor {
  final Dio api;

  DioInterceptor(this.api);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: Retrieve accessToken from SecureStorage
    _addHeaders(options, ApiEndPoints.testToken);
    _logRequestDetails(options);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (_shouldLogResponse(response.requestOptions.path)) {
      _logResponseDetails(response);
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    _logErrorDetails(err);
    if (err.response?.statusCode == 401) {
      await _handleUnauthorizedError(err, handler);
    } else if (err.response?.statusCode == 403) {
      _handleForbiddenError();
    }
    super.onError(err, handler);
  }

  void _addHeaders(RequestOptions options, String? accessToken) {
    options.headers['Authorization'] = 'Bearer $accessToken';
    options.headers['Accept'] = 'application/json';
  }

  void _logRequestDetails(RequestOptions options) {
    final headersLog = options.headers.entries
        .map((entry) => '► ${entry.key}: ${entry.value}')
        .join('\n');

    try {
      final prettyJson =
          const JsonEncoder.withIndent('  ').convert(options.data);
      logger.d(
        "REQUEST ► ${options.method.toUpperCase()} ${options.baseUrl}${options.path}\n"
        "Headers:\n$headersLog\n"
        "❖ QueryParameters : ${options.queryParameters}\n"
        "Body: $prettyJson",
      );
    } catch (e) {
      logger.e("Failed to encode request body to JSON: $e");
    }
  }

  void _logResponseDetails(Response response) {
    final headersLog = response.headers.map.entries
        .map((entry) => '► ${entry.key}: ${entry.value.join(", ")}')
        .join('\n');

    final prettyJson =
        const JsonEncoder.withIndent('  ').convert(response.data);
    logger.d(
      "◀ RESPONSE ${response.statusCode} ${response.requestOptions.baseUrl}${response.requestOptions.path}\n"
      "Headers:\n$headersLog\n"
      "❖ Results:\n$prettyJson",
    );
  }

  void _logErrorDetails(DioException err) {
    final prettyJson = const JsonEncoder.withIndent('  ')
        .convert(err.response?.data ?? "No response data");
    logger.d(
      "◀ ERROR RESPONSE ${err.response?.statusCode} ${err.response?.requestOptions.baseUrl}\n"
      "❖ Results:\n$prettyJson",
    );
  }

  Future<void> _handleUnauthorizedError(
      DioException err, ErrorInterceptorHandler handler) async {
    // sl<SessionManager>().clearSession();
    // sl<AuthBloc>().add(AuthLogoutUser());

    // final refreshToken = sl<SessionManager>().getRefreshToken();
    // if (refreshToken.isNotEmpty && await _refreshToken(refreshToken)) {
    //   final newRequest = await _retry(err.requestOptions);
    //   handler.resolve(newRequest);
    // } else {
    //   super.onError(err, handler);
    // }
  }

  void _handleForbiddenError() {
    // sl<SessionManager>().clearSession();
    // sl<AuthBloc>().add(AuthLogoutUser());
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      headers: {
        ...requestOptions.headers,
        'Authorization': 'Bearer ${"sl<SessionManager>().getAccessToken()"}',
      },
    );
    return api.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  bool _shouldLogResponse(String path) {
    const ignoredPaths = [
      '// IF I will ignore a path  ',
      '//',
    ];
    return !ignoredPaths.contains(path);
  }

  // Future<bool> _refreshToken(String refreshToken) async {
  //   final options = Options(headers: {'Authorization': 'Bearer $refreshToken'});
  //   final res = await api.post(ApiEndPoints.refreshUri, options: options);
  //   if (res.statusCode == 200 || res.statusCode == 201) {
  //     sl<SessionManager>().setTokens(res.data['access_token'], res.data['refresh_token']);
  //     return true;
  //   } else {
  //     sl<SessionManager>().clearSession();
  //     return false;
  //   }
  // }
}
