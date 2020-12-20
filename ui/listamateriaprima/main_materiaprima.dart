


import 'package:calidad_servicioupeu/api/api_materiaprima.dart';
import 'package:calidad_servicioupeu/ui/listamateriaprima/lista_materiaprima.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainMateriaPrima extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider<MateriaprimaApi>(
      create: (context)=>MateriaprimaApi.create(),
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.lightBlue
        ),
        home: ListaMateriaPrima(),
      ),

    );
  }

}