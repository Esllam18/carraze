import 'package:carraze/core/api/end_ponits.dart';
import 'package:carraze/core/cache/cache_helper.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.token] =
        CacheHelper().getData(key: ApiKey.token) != null
        ? 'FOODAPI ${CacheHelper().getData(key: ApiKey.token)}'
        : null;
    super.onRequest(options, handler);
  }
}
