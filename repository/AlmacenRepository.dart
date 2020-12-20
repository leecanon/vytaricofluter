
import 'dart:async';
import 'package:calidad_servicioupeu/api/api_almacen.dart';
import 'package:calidad_servicioupeu/modelo/almacen_modelo.dart';
import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:dio/dio.dart';

class AlmacenRepository{
  AlmacenApi almacenApi;

  AlmacenRepository(){
    Dio _dio=Dio();
    _dio.options.headers["Content-Type"]="application/json";
    almacenApi=AlmacenApi(_dio);
  }

  Future<List<ModeloAlmacen>> getAlmacen() async{
    return await almacenApi.getAlmacen();
  }

  Future<ModeloMensaje> deleteAlmacen(int id) async{
    return await almacenApi.deleteAlmacen(id);
  }

  Future<ModeloMensaje> updateAlmacen(int id, ModeloAlmacen almacen) async{
    return await almacenApi.updateAlmacen(id, almacen);
  }


  Future<ModeloMensaje> createAlmacen(ModeloAlmacen almacen) async{
    return await almacenApi.createAlmacen(almacen);
  }

}