import 'package:equatable/equatable.dart';

abstract class GeneralResponse extends Equatable {
  final int statusCode;
  final String message;

  const GeneralResponse({
    required this.statusCode,
    required this.message,
  });

  Map<String, dynamic> toMap();

  @override
  bool get stringify => true;
}
