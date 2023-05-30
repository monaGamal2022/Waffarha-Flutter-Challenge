bool isNullOrEmpty(dynamic obj) =>
    obj == null ||
    ((obj is String || obj is List || obj is Map) && obj.isEmpty);

bool notNullNorEmpty(dynamic obj) =>
    obj != null &&
    ((obj is String || obj is List || obj is Map) && obj.isNotEmpty);
