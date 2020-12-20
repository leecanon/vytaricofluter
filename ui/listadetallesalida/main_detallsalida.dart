


import 'package:calidad_servicioupeu/api/api_detallesalida.dart';
import 'package:calidad_servicioupeu/ui/listadetallesalida/lista_detallesalida.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainDetalleSalida extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider<DetallesalidaApi>(
      create: (context)=>DetallesalidaApi.create(),
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.lightBlue
        ),
        home: ListaDetallesalida(),
      ),

    );
  }

}