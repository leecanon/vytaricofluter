

import 'dart:async';
import 'package:calidad_servicioupeu/api/api_entrada.dart';
import 'package:calidad_servicioupeu/modelo/entrada_modelo.dart';
import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:dio/dio.dart';

class EntradaRepository{
  EntradaApi entradaApi;

  EntradaRepository(){
    Dio _dio=Dio();
    _dio.options.headers["Content-Type"]="application/json";
    entradaApi=EntradaApi(_dio);
  }

  Future<List<ModeloEntrada>> getEntrada() async{
    return await entradaApi.getEntrada();
  }

  Future<ModeloMensaje> deleteEntrada(int id) async{
    return await entradaApi.deleteEntrada(id);
  }

  Future<ModeloMensaje> updateEntrada(int id, ModeloEntrada entrada) async{
    return await entradaApi.updateEntrada(id, entrada);
  }


  Future<ModeloMensaje> createEntrada(ModeloEntrada entrada) async{
    return await entradaApi.createEntrada(entrada);
  }

}