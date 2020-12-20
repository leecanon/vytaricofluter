import 'package:calidad_servicioupeu/modelo/almacen_modelo.dart';
import 'package:calidad_servicioupeu/modelo/detalleproduccion_model.dart';
import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:calidad_servicioupeu/modelo/productos_modelo.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart' hide Headers;
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

part 'api_detalleproduccion.g.dart';

@RestApi(baseUrl: "http://192.168.2.234:8080/")
abstract class DetalleproduccionApi{
  factory DetalleproduccionApi(Dio dio, {String baseUrl})=_DetalleproduccionApi;

  static DetalleproduccionApi create(){
    final dio=Dio();
    dio.interceptors.add(PrettyDioLogger());
    return DetalleproduccionApi(dio);
  }

  @GET("/detalleproduccion/lista2")
  Future<List<ModeloDetalleProduccion>> getDetalleproduccion();

  @GET("/detalleproduccion/lista2")
  Future<List<ModeloDetalleProduccion>> getDetalleproduccion2(@Header("Authorization") String token);

  @POST("/auth/login")
  Future<ModeloUsuario> login(@Body() ModeloUsuario usuario);

  @GET("/detalleproduccion/detail/{id}")
  Future<ModeloDetalleProduccion> getDetalleproduccionId(@Path("id") String id);

  @DELETE("/detalleproduccion/delete/{id}")
  Future<ModeloMensaje> deleteDetalleproduccion(@Path("id") int id);

  @PUT("/detalleproduccion/update/{id}")
  Future<ModeloMensaje> updateDetalleproduccion(@Path("id") int id, @Body() ModeloDetalleProduccion detalleproduccion);

  @POST("/detalleproduccion/create")
  Future<ModeloMensaje> createDetalleproduccion(@Body() ModeloDetalleProduccion detalleproduccion);

}

