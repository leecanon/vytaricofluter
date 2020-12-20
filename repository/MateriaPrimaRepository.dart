
import 'dart:async';
import 'package:calidad_servicioupeu/api/api_materiaprima.dart';
import 'package:calidad_servicioupeu/modelo/materiaprima_model.dart';
import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:dio/dio.dart';

class MateriaPrimaRepository{
  MateriaprimaApi materiaprimaapi;

  MateriaPrimaRepository(){
    Dio _dio=Dio();
    _dio.options.headers["Content-Type"]="application/json";
    materiaprimaapi=MateriaprimaApi(_dio);
  }

  Future<List<ModeloMateriaPrima>> getMateriaprima() async{
    return await materiaprimaapi.getMateriaprima();
  }

  Future<ModeloMensaje> deleteMateriaprima(int materiaId) async{
    return await materiaprimaapi.deleteMateriaprima(materiaId);
  }

  Future<ModeloMensaje> updateMateriaprima(int id, ModeloMateriaPrima materiaprima) async{
    return await materiaprimaapi.updateMateriaprima(id, materiaprima);
  }


  Future<ModeloMensaje> createMateriaprima(ModeloMateriaPrima materiaprima) async{
    return await materiaprimaapi.createMateriaprima(materiaprima);
  }

}