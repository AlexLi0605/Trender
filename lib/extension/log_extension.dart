import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 16,
    errorMethodCount: 16,
    printTime: true,
  ),
);

extension LogExtension<T> on Future<T> {
  Future<T> logD() {
    return then((data) {
      return data;
    }).catchError((Object error) {
      switch (error.runtimeType) {
        case DioError:
          _logDioError(error as DioError);
          break;
        default:
          logger.e(error.toString());
      }
      return Future<T>.error(error);
    });
  }

  void _logDioError(DioError dioError) {
    final request = dioError.request;
    final response = dioError.response;
    logger.e(
      '''
      Got error : ${response.statusCode} -> ${response.statusMessage}
      Url : ${request.uri.toString()}
      Header : ${request.headers}
      Request : ${request.data}
      Response body: ${response.data}
      ''',
    );
  }
}
