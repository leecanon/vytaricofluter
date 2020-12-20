
part of 'api_almacen.dart';

class _AlmacenApi implements AlmacenApi{
  _AlmacenApi(this._dio, {this.baseUrl}){
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??="http://192.168.2.234:8080/";
  }

  final Dio _dio;
  String baseUrl;

  @override
  getAlmacen() async{
    final prefs= await SharedPreferences.getInstance();
    var tokenx=prefs.getString("token");
    print("VER: ${tokenx}");
    ArgumentError.checkNotNull(tokenx, "token");
    const _extra=<String, dynamic>{};
    final queryParameters= <String, dynamic>{};
    final _data=<String, dynamic>{};
    final Response<List<dynamic>> _result= await _dio.request('/almacen/lista2',
        queryParameters:queryParameters,
        options:RequestOptions(
            method:'GET',
            headers:<String, dynamic>{"Authorization":tokenx},
            extra:_extra,
            baseUrl:baseUrl
        ),
        data:_data);
    var value=_result.data
        .map((dynamic i)=>ModeloAlmacen.fromJson(i as Map<String, dynamic>)).toList();


    return Future.value(value);
  }

  @override
  getAlmacen2(token) async{
    final prefs= await SharedPreferences.getInstance();
    var tokenx=prefs.getString("token");
    print("TOKEN es: $tokenx");
    ArgumentError.checkNotNull(token, "token");
    const _extra=<String, dynamic>{};
    final queryParameters= <String, dynamic>{};
    final _data=<String, dynamic>{};
    final Response<List<dynamic>> _result= await _dio.request('/almacen/lista2',
        queryParameters:queryParameters,
        options:RequestOptions(
            method:'GET',
            headers:<String, dynamic>{"Authorization":token},
            extra:_extra,
            baseUrl:baseUrl
        ),
        data:_data);
    var value=_result.data
        .map((dynamic i)=>ModeloAlmacen.fromJson(i as Map<String, dynamic>)).toList();


    return Future.value(value);
  }

  @override
  login(user) async{
    ArgumentError.checkNotNull(user, "user");
    const _extra=<String, dynamic>{};
    final queryParameters= <String, dynamic>{};
    final _data=<String, dynamic>{};
    _data.addAll(user.toJson()?? <String, dynamic>{});
    final Response<Map<String,dynamic>> _result= await _dio.request('/auth/login',
        queryParameters:queryParameters,
        options:RequestOptions(
            method:'POST',
            headers:<String, dynamic>{},
            extra:_extra,
            baseUrl:baseUrl
        ),
        data:_data);
    var value=ModeloUsuario.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getAlmacenId(id) async{
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/almacen/detail/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ModeloAlmacen.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  deleteAlmacen(id) async{
    ArgumentError.checkNotNull(id, '0');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/almacen/delete/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ModeloMensaje.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  updateAlmacen(id, almacen) async{
    ArgumentError.checkNotNull(id, '0');
    ArgumentError.checkNotNull(almacen, 'almacen');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(almacen.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/almacen/update/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ModeloMensaje.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  createAlmacen(almacen) async{
    ArgumentError.checkNotNull(almacen, 'almacen');
    final prefs= await SharedPreferences.getInstance();
    var tokenx=prefs.getString("token");
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(almacen.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/almacen/create',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{"Authorization":tokenx},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ModeloMensaje.fromJson(_result.data);
    return Future.value(value);
  }

}
