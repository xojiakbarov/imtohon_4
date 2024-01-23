class ServerException implements Exception {
  final String message;
  final String code;

  ServerException({
     this.message = '',
     this.code = '',
  });

  @override
  String toString() => 'ServerException( errorMessage $message, errorCode $code)';
}
