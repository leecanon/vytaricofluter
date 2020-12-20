

import 'dart:async';
import 'package:calidad_servicioupeu/api/api_detalleproduccion.dart';
import 'package:calidad_servicioupeu/modelo/detalleproduccion_model.dart';
import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:dio/dio.dart';

class DetalleProduccionRepository{
  DetalleproduccionApi detalleproduccionApi;

  AlmacenRepository(){
    Dio _dio=Dio();
    _dio.options.headers["Content-Type"]="application/json";
    detalleproduccionApi=DetalleproduccionApi(_dio);
  }

  Future<List<ModeloDetalleProduccion>> getDetalleproduccion() async{
    return await detalleproduccionApi.getDetalleproduccion();
  }

  Future<ModeloMensaje> deleteDetalleproduccion(int id) async{
    return await detalleproduccionApi.deleteDetalleproduccion(id);
  }

  Future<ModeloMensaje> updateDetalleproduccion(int id, ModeloDetalleProduccion detalleproduccion) async{
    return await detalleproduccionApi.updateDetalleproduccion(id, detalleproduccion);
  }


  Future<ModeloMensaje> createDetalleproduccion(ModeloDetalleProduccion detalleproduccion) async{
    return await detalleproduccionApi.createDetalleproduccion(detalleproduccion);
  }

}