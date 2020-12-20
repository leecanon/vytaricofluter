
part of 'api_entrada.dart';

class _EntradaApi implements EntradaApi{
  _EntradaApi(this._dio, {this.baseUrl}){
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??="http://192.168.2.234:8080/";
  }

  final Dio _dio;
  String baseUrl;

  @override
  getEntrada() async{
    final prefs= await SharedPreferences.getInstance();
    var tokenx=prefs.getString("token");

    print("VER x: ${tokenx}");
    ArgumentError.checkNotNull(tokenx, "token");
    const _extra=<String, dynamic>{};
    final queryParameters= <String, dynamic>{};
    final _data=<String, dynamic>{};
    final Response<List<dynamic>> _result= await _dio.request('/detalleentrada/lista2',
        queryParameters:queryParameters,
        options:RequestOptions(
            method:'GET',
            headers:<String, dynamic>{"Authorization":tokenx},
            extra:_extra,
            baseUrl:baseUrl
        ),
        data:_data);
    print(_result.data);

    var value=_result.data
        .map((dynamic i)=>ModeloEntrada.fromJson(i as Map<String, dynamic>)).toList();
    print('objecto de pruebas +++++++++++++++++++++++++++++++++++++++++++++++++ ${value} ' );
    return Future.value(value);
  }

  @override
  getEntrada2(token) async{
    final prefs= await SharedPreferences.getInstance();
    var tokenx=prefs.getString("token");
    print("TOKEN es: $tokenx");
    ArgumentError.checkNotNull(token, "token");
    const _extra=<String, dynamic>{};
    final queryParameters= <String, dynamic>{};
    final _data=<String, dynamic>{};
    final Response<List<dynamic>> _result= await _dio.request('/detalleentrada/lista2',
        queryParameters:queryParameters,
        options:RequestOptions(
            method:'GET',
            headers:<String, dynamic>{"Authorization":token},
            extra:_extra,
            baseUrl:baseUrl
        ),
        data:_data);
    var value=_result.data
        .map((dynamic i)=>ModeloEntrada.fromJson(i as Map<String, dynamic>)).toList();


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
  getEntradaId(id) async{
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/detalleentrada/detail/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ModeloEntrada.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  deleteEntrada(id) async{
    ArgumentError.checkNotNull(id, '0');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/detalleentrada/delete/$id',
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
  updateEntrada(id, entrada) async{
    ArgumentError.checkNotNull(id, '0');
    ArgumentError.checkNotNull(entrada, 'detalleentrada');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(entrada.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/detalleentrada/update/$id',
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
  createEntrada(entrada) async{
    ArgumentError.checkNotNull(entrada, 'detalleentrada');
    final prefs= await SharedPreferences.getInstance();
    var tokenx=prefs.getString("token");
    print('comillas ');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(entrada.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/detalleentrada/create',
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
