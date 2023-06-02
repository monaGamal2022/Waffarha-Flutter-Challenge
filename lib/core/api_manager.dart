import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:waffarha_challenge/core/exceptions.dart';
import 'package:waffarha_challenge/core/failure_handler.dart';
import 'package:waffarha_challenge/core/models/response_model.dart';
import 'package:waffarha_challenge/core/request/base_request.dart';
import 'package:waffarha_challenge/core/services/app_logger.dart';
import 'package:waffarha_challenge/core/status_checker.dart';
import 'package:waffarha_challenge/core/utils/request_to_curl.dart';

import 'failures.dart';
import 'models/message_response.dart';
export 'exceptions.dart';
export 'failure_handler.dart';
export 'failures.dart';
export 'models/message_response.dart';
export 'models/request_model.dart';
export 'models/response_model.dart';
export 'request/base_request.dart';
export 'status_checker.dart';

class APIsManager {
  APIsManager({
    this.interceptors = const [],
  }) {
    if (shouldLog) {
      _dio.interceptors.addAll(interceptors);
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
      );
    }
  }

  final StatusChecker _statusChecker = StatusChecker();
  final FailureHandler _failureHandler = FailureHandler();
  final Dio _dio = Dio();
  final List<Interceptor> interceptors;

  Future<Either<Failure, R>> send<R, ER extends ResponseModel>({
    required Request request,
    R Function(Map<String, dynamic> map)? responseFromMap,
    ER Function(Map<String, dynamic> map)? errorResponseFromMap,
    bool isListResponse = false,
    R Function(List list)? responseFromList,
  }) async {
    Response<dynamic>? response;
    try {
      response = await _dio.request(
        request.url,
        data: await request.data,
        queryParameters: await request.queryParameters,
        cancelToken: request.cancelToken,
        onSendProgress: request.requestModel.progressListener?.onSendProgress,
        onReceiveProgress:
            request.requestModel.progressListener?.onReceiveProgress,
        options: Options(
          headers: request.headers,
          method: request.method,
        ),
      );

      dio2curl(response.requestOptions, isMultiPart: request.multiPart);
      var resp = response.data;

      // if (resp is! Map<String, dynamic>) {
      //   dynamic mapResponse;
      //   try {
      //     mapResponse =
      //         isListResponse ? response.data : json.decode(response.data);
      //   } catch (e) {
      //     e.toString();
      //   }
      //   if (mapResponse != null && mapResponse is Map) {
      //     resp = mapResponse;
      //   } else {
      //     resp = {'response': resp};
      //   }
      // }

      if (response.data is List && responseFromList != null) {
        return Right(responseFromList(response.data));
      }
      return Right(responseFromMap!(response.data));
    } on DioError catch (error) {
      // dio2curl(error.response?.requestOptions);
      if (error.type == DioErrorType.badResponse) {
        if (error.response?.statusCode != null &&
            _statusChecker(error.response!.statusCode) == HTTPCodes.error) {
          try {
            Map<String, dynamic> errorData = {};
            if (error.response!.data is Map<String, dynamic>) {
              errorData = error.response!.data;
            } else {
              errorData = {'error': error.response!.data};
            }
            final exception = ErrorException(
                error.response!.statusCode!,
                errorResponseFromMap != null
                    ? errorResponseFromMap(errorData)
                    : MessageResponse.fromMap(error.response!.data)
                // : MessageResponse.fromMap(errorData,code:error.response!.statusCode.toString()),
                );
            return Left(
              _failureHandler.handle(
                request: request,
                exception: exception,
                response: error.response,
              ),
            );
          } catch (exception) {
            return Left(
              _failureHandler.handle(
                request: request,
                exception: exception,
                response: response,
              ),
            );
          }
        } else {
          final exception = ServerException(error.response);
          return Left(
            _failureHandler.handle(
              request: request,
              exception: exception,
              response: error.response,
            ),
          );
        }
      }
      return Left(
        _failureHandler.handle(
          request: request,
          exception: error,
          response: error.response,
        ),
      );
    } catch (exception) {
      dio2curl(response?.requestOptions, isMultiPart: request.multiPart);
      return Left(
        _failureHandler.handle(
          request: request,
          exception: exception,
          response: response,
        ),
      );
    }
  }
}
