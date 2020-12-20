part of 'api_proveedor.dart';

class _ProveedorApi implements ProveedorApi{
  _ProveedorApi(this._dio, {this.baseUrl}){
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??="http://192.168.2.234:8080";
  }

  final Dio _dio;
  String baseUrl;

  @override
  getProveedor() async{
    final prefs= await SharedPreferences.getInstance();
    var tokenx=prefs.getString("token");
    print("VER: ${tokenx}");
    ArgumentError.checkNotNull(tokenx, "token");
    const _extra=<String, dynamic>{};
    final queryParameters= <String, dynamic>{};
    final _data=<String, dynamic>{};
    final Response<List<dynamic>> _result= await _dio.request('/proveedor/lista2',
        queryParameters:queryParameters,
        options:RequestOptions(
            method:'GET',
            headers:<String, dynamic>{"Authorization":tokenx},
            extra:_extra,
            baseUrl:baseUrl
        ),
        data:_data);
    var value=_result.data
        .map((dynamic i)=>ModeloProveedor.fromJson(i as Map<String, dynamic>)).toList();


    return Future.value(value);
  }

  @override
  getProveedor2(token) async{
    final prefs= await SharedPreferences.getInstance();
    var tokenx=prefs.getString("token");
    print("TOKEN es: $tokenx");
    ArgumentError.checkNotNull(token, "token");
    const _extra=<String, dynamic>{};
    final queryParameters= <String, dynamic>{};
    final _data=<String, dynamic>{};
    final Response<List<dynamic>> _result= await _dio.request('/proveedor/lista2',
        queryParameters:queryParameters,
        options:RequestOptions(
            method:'GET',
            headers:<String, dynamic>{"Authorization":token},
            extra:_extra,
            baseUrl:baseUrl
        ),
        data:_data);
    var value=_result.data
        .map((dynamic i)=>ModeloProveedor.fromJson(i as Map<String, dynamic>)).toList();


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
  getProveedorId(idProveedor) async{
    ArgumentError.checkNotNull(idProveedor, 'idProveedor');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/proveedor/detail/$idProveedor',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ModeloProveedor.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  deleteProveedor(idProveedor) async{
    ArgumentError.checkNotNull(idProveedor, '0');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/proveedor/delete/$idProveedor',
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
  updateProveedor(idProveedor, proveedor) async{
    ArgumentError.checkNotNull(idProveedor, '0');
    ArgumentError.checkNotNull(proveedor, 'proveedor');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(proveedor.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/proveedor/update/$idProveedor',
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
  createProveedor(proveedor) async{
    ArgumentError.checkNotNull(proveedor, 'proveedor');
    final prefs= await SharedPreferences.getInstance();
    var tokenx=prefs.getString("token");
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(proveedor.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/proveedor/create',
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
