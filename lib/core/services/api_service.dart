import 'package:dio/dio.dart';
import '../failure/failure.dart';
import '../utils/logger.dart';
import 'package:dartz/dartz.dart';

import 'dio_interceptor.dart';

class ApiService {
  // String baseUrl = dotenv.get('BASE_API_URL');

  late Dio _dio;

  ApiService() {
    // logger.e("HERE API SERVICES $baseUrl");
    _dio = _createDio();
    _dio.interceptors.add(DioInterceptor(_createDio()));
  }

  Dio get dio {
    final dio = _createDio();

    dio.interceptors.add(DioInterceptor(_createDio()));

    return dio;
  }

  Dio _createDio() => Dio(
        BaseOptions(
          baseUrl: "",
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
          followRedirects: true,
          validateStatus: (status) {
            return status! < 303;
          },
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

  Future<Either<Failure, T>> get<T, E>({
    required String url,
    required T Function(dynamic) converter,
  }) async {
    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(converter(response.data));
      }
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    } on DioException catch (err) {
      logger.e('Error Api url $url \n$err \nFailed to perform GET request $T ');
      return Left(
        ServerErrorFailure('Failed: ${err.response?.data['message']}'),
      );
    }
  }

  Future<Either<Failure, T>> post<T, E>({
    required String url,
    dynamic data,
    required T Function(dynamic) converter,
  }) async {
    try {
      final response = await _dio.post(url, data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(converter(response.data));
      }
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    } on DioException catch (err) {
      logger.e('Error Api url $url \n$err \nFailed to perform GET request $T ');

      return Left(
        ServerErrorFailure('Failed: ${err.response?.data['message']}'),
      );
    }
  }

  Future<Either<Failure, T>> put<T, E>({
    required String url,
    dynamic data,
    required T Function(dynamic) converter,
  }) async {
    try {
      final response = await _dio.put(url, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(converter(response.data));
      }
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    } on DioException catch (err) {
      logger.e('Error Api url $url \n$err \nFailed to perform GET request $T ');
      return Left(
        ServerErrorFailure('Failed: ${err.response?.data['message']}'),
      );
    }
  }

  Future<Either<Failure, T>> destroy<T, E>({
    required String url,
    required T Function(dynamic) converter,
  }) async {
    try {
      final response = await _dio.delete(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(converter(response.data));
      }
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    } on DioException catch (err) {
      logger.e('Error Api url $url \n$err \nFailed to perform GET request $T ');
      return Left(
        ServerErrorFailure('Failed: ${err.response?.data['message']}'),
      );
    }
  }
}
