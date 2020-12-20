
import 'dart:async';
import 'package:calidad_servicioupeu/api/api_detallesalida.dart';
import 'package:calidad_servicioupeu/modelo/detallesalida_model.dart';
import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:dio/dio.dart';

class DetalleSalidaRepository{
  DetallesalidaApi detallesalidaapi;

  DetalleSalidaRepository(){
    Dio _dio=Dio();
    _dio.options.headers["Content-Type"]="application/json";
    detallesalidaapi=DetallesalidaApi(_dio);
  }

  Future<List<ModeloDetalleSalida>> getDetallesalida() async{
    return await detallesalidaapi.getDetallesalida();
  }

  Future<ModeloMensaje> deleteDetalleSalida(int id) async{
    return await detallesalidaapi.deleteDetallesalida(id);
  }

  Future<ModeloMensaje> updateDetalleSalida(int id, ModeloDetalleSalida detallesalida) async{
    return await detallesalidaapi.updateDetallesalida(id, detallesalida);
  }


  Future<ModeloMensaje> createDetalleSalida(ModeloDetalleSalida detallesalida) async{
    return await detallesalidaapi.createDetallesalida(detallesalida);
  }

}