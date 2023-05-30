import 'response_model.dart';

class MessageResponse extends ResponseModel {
  const MessageResponse({
    super.statusCode,
    super.message,
  });

  factory MessageResponse.fromMap(
    Map<String, dynamic> map,
  ) =>
      MessageResponse(
        statusCode: map['Status'] ?? map['status'] ?? map['statusCode'],
        message: map['Message'] ?? map['message'] ?? map['errorMessage'] ?? map['description'],
      );
}
