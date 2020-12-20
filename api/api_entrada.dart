
import 'package:calidad_servicioupeu/modelo/entrada_modelo.dart';
import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:calidad_servicioupeu/modelo/productos_modelo.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart' hide Headers;
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

part 'api_entrada.g.dart';

@RestApi(baseUrl: "http://192.168.2.234:8080/")
abstract class EntradaApi{
  factory EntradaApi(Dio dio, {String baseUrl})= _EntradaApi;

  static EntradaApi create(){
    final dio=Dio();
    dio.interceptors.add(PrettyDioLogger());
    return EntradaApi(dio);
  }

  @GET("/entrada/lista2")
  Future<List<ModeloEntrada>> getEntrada();

  @GET("/entrada/lista2")
  Future<List<ModeloEntrada>> getEntrada2(@Header("Authorization") String token);

  @POST("/auth/login")
  Future<ModeloUsuario> login(@Body() ModeloUsuario usuario);

  @GET("/entrada/detail/{id}")
  Future<ModeloEntrada> getEntradaId(@Path("id") String id);

  @DELETE("/entrada/delete/{id}")
  Future<ModeloMensaje> deleteEntrada(@Path("id") int id);

  @PUT("/entrada/update/{id}")
  Future<ModeloMensaje> updateEntrada(@Path("id") int id, @Body() ModeloEntrada entrada);

  @POST("/entrada/create")
  Future<ModeloMensaje> createEntrada(@Body() ModeloEntrada entrada);

}

