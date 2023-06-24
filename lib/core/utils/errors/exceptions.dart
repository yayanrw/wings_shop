class ServerException implements Exception {
  final String message;

  ServerException(this.message);
}

class DatabaseException implements Exception {
  DatabaseException(this.message);

  final String message;
}

class ApplicationException implements Exception {
  final String message;

  ApplicationException(this.message);
}
