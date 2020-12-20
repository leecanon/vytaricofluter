
import 'dart:async';
import 'package:calidad_servicioupeu/api/api_periodo.dart';
import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:calidad_servicioupeu/modelo/periodo_modelo.dart';
import 'package:dio/dio.dart';

class PeriodoRepository{
  PeriodoApi periodoapi;

  PeriodoRepository(){
    Dio _dio=Dio();
    _dio.options.headers["Content-Type"]="application/json";
    periodoapi=PeriodoApi(_dio);
  }

  Future<List<ModeloPeriodo>> getPeriodo() async{
    return await periodoapi.getPeriodo();
  }

  Future<ModeloMensaje> deletePeriodo(int idPeriodo) async{
    return await periodoapi.deletePeriodo(idPeriodo);
  }

  Future<ModeloMensaje> updatePeriodo(int id, ModeloPeriodo periodo) async{
    return await periodoapi.updatePeriodo(id, periodo);
  }


  Future<ModeloMensaje> createPeriodo(ModeloPeriodo periodo) async{
    return await periodoapi.createPeriodo(periodo);
  }

}