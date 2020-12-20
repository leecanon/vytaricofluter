import 'package:calidad_servicioupeu/modelo/detallesalida_model.dart';
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

part 'api_detallesalida.g.dart';

@RestApi(baseUrl: "http://192.168.2.234:8080/detallesalida")
abstract class DetallesalidaApi{

  factory DetallesalidaApi(Dio dio,{String baseUrl})= _DetallesalidaApi;

  static DetallesalidaApi create(){
    final dio=Dio();
    dio.interceptors.add(PrettyDioLogger());
    return DetallesalidaApi(dio);
  }
  @GET("/lista")
  Future<List<ModeloDetalleSalida>> getDetallesalida();

  @GET("/lista2")
  Future<List<ModeloDetalleSalida>>   getDetallesalida2(@Header("Authorization") String token);

  @POST("/auth/login")
  Future<ModeloUsuario> login(@Body() ModeloUsuario usuario);

  @GET("/detallesalida/detail/{id}")
  Future<ModeloDetalleSalida> getDetallesalidaId(@Path("id") String id);

  @DELETE("/detallesalida/delete/{id}")
  Future<ModeloMensaje> deleteDetallesalida(@Path("id") int id);

  @PUT("/detallesalida/update/{id}")
  Future<ModeloMensaje> updateDetallesalida(@Path("id") int id, @Body() ModeloDetalleSalida detallesalida);

  @POST("/detallesalida/create")
  Future<ModeloMensaje> createDetallesalida(@Body() ModeloDetalleSalida detallesalida);

}


