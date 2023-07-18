class ServerException implements Exception {
  final String message;

  ServerException({required this.message});
}

class UnAuthorizedException implements Exception {}

class DataBaseException implements Exception {}
