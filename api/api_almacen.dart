import 'package:calidad_servicioupeu/modelo/almacen_modelo.dart';
import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:calidad_servicioupeu/modelo/productos_modelo.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart' hide Headers;
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

part 'api_almacen.g.dart';

@RestApi(baseUrl: "http://192.168.2.234:8080/")
abstract class AlmacenApi{
  factory AlmacenApi(Dio dio, {String baseUrl})=_AlmacenApi;

  static AlmacenApi create(){
    final dio=Dio();
    dio.interceptors.add(PrettyDioLogger());
    return AlmacenApi(dio);
  }

  @GET("/almacen/lista2")
  Future<List<ModeloAlmacen>> getAlmacen();

  @GET("/almacen/lista2")
  Future<List<ModeloAlmacen>> getAlmacen2(@Header("Authorization") String token);

  @POST("/auth/login")
  Future<ModeloUsuario> login(@Body() ModeloUsuario usuario);

  @GET("/almacen/detail/{id}")
  Future<ModeloAlmacen> getAlmacenId(@Path("id") String id);

  @DELETE("/almacen/delete/{id}")
  Future<ModeloMensaje> deleteAlmacen(@Path("id") int id);

  @PUT("/almacen/update/{id}")
  Future<ModeloMensaje> updateAlmacen(@Path("id") int id, @Body() ModeloAlmacen almacen);

  @POST("/almacen/create")
  Future<ModeloMensaje> createAlmacen(@Body() ModeloAlmacen almacen);

}

