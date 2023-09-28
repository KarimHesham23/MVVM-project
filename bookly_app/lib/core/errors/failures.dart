import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessages;

  Failures({required this.errorMessages});
}

class ServerFailure extends Failures {
  ServerFailure({required super.errorMessages});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            errorMessages: "connection timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessages: "Send timeout with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessages: "Receive timeout with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerFailure(
            errorMessages: "Bad certificate SSL with ApiServer");
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errorMessages: "Receive To ApiServer Cancel");

      case DioExceptionType.connectionError:
        return ServerFailure(errorMessages: "No Internet Connection");

      case DioExceptionType.unknown:
        return ServerFailure(
            errorMessages: "Unexpected Error,Please try later!");
      default:
        return ServerFailure(
            errorMessages: "opps There was an Error,Please try again");
    }
  }

  factory ServerFailure.fromBadResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessages: response["error"]["message"]);
    } else if (statusCode == 404) {
      return ServerFailure(
          errorMessages: "Your request Not found,Please try later!");
    } else if (statusCode == 500) {
      return ServerFailure(
          errorMessages: "Internal Server error,Please try later!");
    } else if (statusCode == 429) {
      return ServerFailure(
          errorMessages: "Many request happended ,Please try later!");
    }
    return ServerFailure(
        errorMessages: "opps There was an Error,Please try again");
  }
}
