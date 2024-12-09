import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:lift/core/exception/api_exception.dart';
import 'package:lift/core/services/api_services/base_api_services.dart';
import 'package:http/http.dart' as http;

class ApiServices extends BaseApiServices {
  @override
  Future getApi(uri, {Map<String, String>? headers}) async {
    try {
      final header = headers ??
          {
            'Content-Type': 'application/json',
          };
      final response = await http.get(Uri.parse(uri), headers: header);
      return returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw TimeOutException();
    } catch (error) {
      throw Exception('Unexpected error occurred: $error');
    }
  }

  @override
  Future postApi(uri, value, {Map<String, String>? headers}) async {
    try {
      final header = headers ??
          {
            'Content-Type': 'application/json',
          };
      final response = await http.post(Uri.parse(uri),
          headers: header, body: jsonEncode(value));
      return returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw TimeOutException();
    } catch (error) {
      throw Exception('Unexpected error occurred: $error');
    }
  }

  @override
  Future putApi(uri) {
    // TODO: implement putApi
    throw UnimplementedError();
  }

  @override
  Future patchApi(uri) {
    // TODO: implement patchApi
    throw UnimplementedError();
  }

  @override
  Future deleteApi(uri) {
    // TODO: implement deleteApi
    throw UnimplementedError();
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 201:
        return jsonDecode(response.body);
      case 202:
        return jsonDecode(response.body);
      case 204:
        return null;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw ForbiddenException(response.body.toString());
      case 404:
        throw NotFoundException(response.body.toString());
      case 409:
        throw ConflictException(response.body.toString());
      case 500:
        throw InternalServerException(response.body.toString());
      case 502:
        throw BadGatewayException(response.body.toString());
      case 503:
        throw ServiceUnavailableException(response.body.toString());
      case 504:
        throw GatewayTimeoutException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occurred while communicating with server, StatusCode: ${response.statusCode}');
    }
  }
}
