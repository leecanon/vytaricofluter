import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:calidad_servicioupeu/modelo/periodo_modelo.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
//import 'package:json_annotation/json_annotation.dart';
//import 'package:calidad_servicioupeu/modelo/productos_modelo.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart' hide Headers;
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

part 'api_periodo.g.dart';

@RestApi(baseUrl: "http://192.168.2.234:8080/periodo")
abstract class PeriodoApi{

  factory PeriodoApi(Dio dio,{String baseUrl})= _PeriodoApi;

  static PeriodoApi create(){
    final dio=Dio();
    dio.interceptors.add(PrettyDioLogger());
    return PeriodoApi(dio);
  }
  @GET("/lista")
  Future<List<ModeloPeriodo>> getPeriodo();

  @GET("/lista2")
  Future<List<ModeloPeriodo>>   getPeriodo2(@Header("Authorization") String token);

  @POST("/auth/login")
  Future<ModeloUsuario> login(@Body() ModeloUsuario usuario);

  @GET("/periodo/detail/{id}")
  Future<ModeloPeriodo> getPeriodoId(@Path("id") String id);

  @DELETE("/periodo/delete/{id}")
  Future<ModeloMensaje> deletePeriodo(@Path("id") int id);

  @PUT("/periodo/update/{id}")
  Future<ModeloMensaje> updatePeriodo(@Path("id") int id, @Body() ModeloPeriodo periodo);

  @POST("/periodo/create")
  Future<ModeloMensaje> createPeriodo(@Body() ModeloPeriodo periodo);

}


