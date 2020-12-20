import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:calidad_servicioupeu/modelo/proveedor_modelo.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:calidad_servicioupeu/modelo/productos_modelo.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart' hide Headers;
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

part 'api_proveedor.g.dart';

@RestApi(baseUrl: "http://192.168.2.234:8080")
abstract class ProveedorApi{
  factory ProveedorApi(Dio dio, {String baseUrl})=_ProveedorApi;

  static ProveedorApi create(){
    final dio=Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ProveedorApi(dio);
  }

  @GET("/proveedor/lista2")
  Future<List<ModeloProveedor>> getProveedor();

  @GET("/proveedor/lista2")
  Future<List<ModeloProveedor>> getProveedor2(@Header("Authorization") String token);

  @POST("/auth/login")
  Future<ModeloUsuario> login(@Body() ModeloUsuario usuario);

  @GET("/proveedor/detail/{idProveedor}")
  Future<ModeloProveedor> getProveedorId(@Path("idProveedor") String idProveedor);

  @DELETE("/proveedor/delete/{idProveedor}")
  Future<ModeloMensaje> deleteProveedor(@Path("idProveedor") int idProveedor);

  @PUT("/proveedor/update/{idProveedor}")
  Future<ModeloMensaje> updateProveedor(@Path("idProveedor") int idProveedor, @Body() ModeloProveedor proveedor);

  @POST("/proveedor/create")
  Future<ModeloMensaje> createProveedor(@Body() ModeloProveedor proveedor);


}



