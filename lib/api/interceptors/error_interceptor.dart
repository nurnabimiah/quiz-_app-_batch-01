import 'package:dio/dio.dart';

/// A custom Dio Interceptor to handle error scenarios globally,
/// transforming raw errors/status codes into user-friendly messages.
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final userFriendlyMessage = _getErrorMessage(err);

    final resolvedException = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: err.error,
      message: userFriendlyMessage,
    );

    super.onError(resolvedException, handler);
  }

  String _getErrorMessage(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please check your network connectivity.';
      case DioExceptionType.sendTimeout:
        return 'Request send timeout. Please try again.';
      case DioExceptionType.receiveTimeout:
        return 'Response receive timeout. Server is taking too long to respond.';
      case DioExceptionType.badCertificate:
        return 'Secure connection failed. Invalid certificate.';
      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        if (statusCode != null) {
          switch (statusCode) {
            case 400:
              return 'Bad Request (400): The server could not understand the request.';
            case 401:
              return 'Unauthorized (401): Please login again to continue.';
            case 403:
              return 'Forbidden (403): You do not have permission to access this resource.';
            case 404:
              return 'Not Found (404): The requested resource could not be found.';
            case 408:
              return 'Request Timeout (408): The server timed out waiting for the request.';
            case 500:
              return 'Internal Server Error (500): Something went wrong on the server.';
            case 502:
              return 'Bad Gateway (502): The server received an invalid response.';
            case 503:
              return 'Service Unavailable (503): The server is temporarily offline.';
            case 504:
              return 'Gateway Timeout (504): The upstream server failed to respond in time.';
            default:
              return 'Error ($statusCode): Received unexpected response from the server.';
          }
        }
        return 'Invalid response format from server.';
      case DioExceptionType.cancel:
        return 'Request was cancelled.';
      case DioExceptionType.connectionError:
        return 'No internet connection. Please check your Wi-Fi or cellular data.';
      case DioExceptionType.unknown:
        if (err.message != null && err.message!.contains('SocketException')) {
          return 'No internet connection. Please verify your connection status.';
        }
        return 'An unexpected error occurred. Please try again.';
    }
  }
}
