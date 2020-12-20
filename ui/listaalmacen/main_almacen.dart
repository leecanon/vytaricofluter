


import 'package:calidad_servicioupeu/ui/listaAlmacen/lista_almacen.dart';
import 'package:calidad_servicioupeu/api/api_almacen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainAlmacen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider<AlmacenApi>(
      create: (context)=>AlmacenApi.create(),
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.lightBlue
        ),
        home: ListaAlmacen(),
      ),

    );
  }

}