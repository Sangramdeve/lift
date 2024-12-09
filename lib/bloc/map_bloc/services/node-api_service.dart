import 'package:lift/core/constants/api_urls.dart';
import 'package:lift/core/services/api_services/api_services.dart';

class BackendResponse {
  final networkApi = ApiServices();

  Future<dynamic> findMatches() async {
    final value = networkApi.getApi(ApiUrl.rideMatch);
    return value;
  }



}
