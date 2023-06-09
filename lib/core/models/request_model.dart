import 'package:equatable/equatable.dart';
// ignore: implementation_imports
import 'package:dio/src/cancel_token.dart';

abstract class RequestModel extends Equatable {
  RequestModel(this.progressListener);

  final cancelToken = CancelToken();
  void cancelRequest([dynamic reason]) => cancelToken.cancel(reason);

  final RequestProgressListener? progressListener;

  Future<Map<String, dynamic>> toMap();
}

class RequestProgressListener {
  RequestProgressListener({this.onSendProgress, this.onReceiveProgress});

  final Function(int, int)? onSendProgress;
  final Function(int, int)? onReceiveProgress;
}

class EmptyRequestModel extends RequestModel {
  EmptyRequestModel({RequestProgressListener? progressListener})
      : super(progressListener);

  @override
  List<Object?> get props => [];

  @override
  Future<Map<String, dynamic>> toMap() async => {};
}
