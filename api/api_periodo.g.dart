
part of 'api_periodo.dart';

class _PeriodoApi implements PeriodoApi{
  _PeriodoApi(this._dio,{this.baseUrl}){
    ArgumentError.checkNotNull(_dio, "_dio");
    this.baseUrl ??="http://192.168.2.234:8080/periodo";
  }

  final Dio _dio;
  String baseUrl;

  @override
  getPeriodo() async{

    print("hola");
    const _extra=<String, dynamic>{};
    final _queryParameters=<String, dynamic>{};
    final _data=<String, dynamic>{};
    final Response<List<dynamic>> _result= await _dio.request('/lista',
        queryParameters:_queryParameters,
        options:RequestOptions(
            method: 'GET',
            headers:<String, dynamic>{},
            extra:_extra,
            baseUrl:baseUrl
        ),
        data:_data);
    var value = _result.data
        .map((dynamic i)=>ModeloPeriodo.fromJson(i as Map<String, dynamic>)).toList();

    print("value $value");
    return Future.value(value);
  }

  @override
  getPeriodo2(token) async{

    final prefs = await SharedPreferences.getInstance();
    var tokenx=prefs.getString("token");
    print("Token es: $tokenx");

    ArgumentError.checkNotNull(token, "token");

    const _extra=<String, dynamic>{};
    final _queryParameters=<String, dynamic>{};
    final _data=<String, dynamic>{};
    final Response<List<dynamic>> _result= await _dio.request('/lista2',
        queryParameters:_queryParameters,
        options:RequestOptions(
            method: 'GET',
            headers:<String, dynamic>{"Authorization":token},
            extra:_extra,
            baseUrl:baseUrl
        ),
        data:_data);
    var value = _result.data
        .map((dynamic i)=>ModeloPeriodo.fromJson(i as Map<String, dynamic>)).toList();

    return Future.value(value);
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}