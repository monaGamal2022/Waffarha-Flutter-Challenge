import 'package:equatable/equatable.dart';

abstract class ResponseModel extends Equatable {
  final int? statusCode;
  final String? message;

  const ResponseModel({
    required this.statusCode,
    required this.message,
  });

  @override
  List<Object?> get props => [
        statusCode,
        message,
      ];
}
