import 'package:booklyapp/core/errors/failures.dart';
import 'package:dio/dio.dart';

class ServerFailure extends Failures {
  ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with api server ");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with api server ");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Reseve timeout ");
      case DioExceptionType.badCertificate:
        return ServerFailure("Bad certificate with api server ");
      case DioExceptionType.badResponse: //! status code
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Cancel");
      case DioExceptionType.connectionError:
        if (dioException.message!.contains("SocketException")) {
          return ServerFailure(" No Internet Connection ");
        }
        return ServerFailure("Unexpected error , Please try again!");

      case DioExceptionType.unknown:
        return ServerFailure("Unknown error");
      default:
        return ServerFailure("Opps there was an error , Please try later!");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response["error"]["message"]);
    } else if (statusCode == 404) {
      return ServerFailure("Not Found , Please try later!");
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server Error, Please try later!");
    } else {
      return ServerFailure("Opps there was an error , Please try later!");
    }
  }
}
