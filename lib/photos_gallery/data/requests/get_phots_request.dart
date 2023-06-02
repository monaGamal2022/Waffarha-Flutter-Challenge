import 'package:waffarha_challenge/core/api_manager.dart';
import 'package:waffarha_challenge/core/request/base_request.dart';

class GetPhotosRequest with Request, GetRequest {
  final int start;
  final int limitPP;
  final String? sortBy;

  GetPhotosRequest({
    required this.start,
    this.limitPP = 10,
    this.sortBy,
  });
  @override
  Future<Map<String, dynamic>?> get queryParameters async => {
        "_start": start,
        "_limit": limitPP,
        if (sortBy != null) "_sort": sortBy,
      };

  @override
  final String path = '/photos';
}
