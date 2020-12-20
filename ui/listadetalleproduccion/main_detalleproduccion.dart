


import 'package:calidad_servicioupeu/api/api_detalleproduccion.dart';
import 'package:calidad_servicioupeu/ui/listadetalleproduccion/lista_detalleproduccion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainDetalleProduccion extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider<DetalleproduccionApi>(
      create: (context)=>DetalleproduccionApi.create(),
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.lightBlue
        ),
        home: ListaDetalleproduccion(),
      ),

    );
  }

}