abstract class BaseApiServices {
  Future<dynamic> getApi(String uri,{Map<String,String>? headers});

  Future<dynamic> postApi(String uri,value,{Map<String,String>? headers});

  Future<dynamic> putApi(String uri);

  Future<dynamic> patchApi(String uri);

  Future<dynamic> deleteApi(String uri);
}
