import 'package:waffarha_challenge/core/api_manager.dart';
import 'package:waffarha_challenge/core/request/base_request.dart';

class GetPhotosRequest with Request, GetRequest {
  @override
  final String path = '/photos';
}
