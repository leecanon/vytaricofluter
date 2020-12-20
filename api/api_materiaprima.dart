import 'package:calidad_servicioupeu/modelo/materiaprima_model.dart';
import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
//import 'package:json_annotation/json_annotation.dart';
//import 'package:calidad_servicioupeu/modelo/productos_modelo.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart' hide Headers;
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

part 'api_materiaprima.g.dart';

@RestApi(baseUrl: "http://192.168.2.234:8080/materiaprima")
abstract class MateriaprimaApi{

  factory MateriaprimaApi(Dio dio,{String baseUrl})= _MateriaprimaApi;

  static MateriaprimaApi create(){
    final dio=Dio();
    dio.interceptors.add(PrettyDioLogger());
    return MateriaprimaApi(dio);
  }
  @GET("/lista")
  Future<List<ModeloMateriaPrima>> getMateriaprima();

  @GET("/lista2")
  Future<List<ModeloMateriaPrima>>   getMateriaprima2(@Header("Authorization") String token);

  @POST("/auth/login")
  Future<ModeloUsuario> login(@Body() ModeloUsuario usuario);

  @GET("/materiaprima/detail/{id}")
  Future<ModeloMateriaPrima> getMateriaprimaId(@Path("id") String id);

  @DELETE("/materiaprima/delete/{id}")
  Future<ModeloMensaje> deleteMateriaprima(@Path("id") int id);

  @PUT("/materiaprima/update/{id}")
  Future<ModeloMensaje> updateMateriaprima(@Path("id") int id, @Body() ModeloMateriaPrima materiaprima);

  @POST("/materiaprima/create")
  Future<ModeloMensaje> createMateriaprima(@Body() ModeloMateriaPrima materiaprima);

}


