// ignore_for_file: depend_on_referenced_packages

import 'package:equatable/equatable.dart';
// ignore: implementation_imports
import 'package:dio/src/response.dart';
import 'models/response_model.dart';

class ErrorException extends Equatable implements Exception {
  const ErrorException(this.statusCode, this.error);

  final int statusCode;
  final ResponseModel error;

  @override
  List<Object?> get props => [statusCode, error];
}

class ServerException extends Equatable implements Exception {
  const ServerException(this.response);

  final Response? response;

  @override
  List<Object?> get props => [response];
}

class ValidationException extends Equatable implements Exception {
  const ValidationException(this.value);

  final String value;

  @override
  List<Object?> get props => [value];
}
