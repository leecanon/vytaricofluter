


import 'package:calidad_servicioupeu/api/api_entrada.dart';
import 'package:calidad_servicioupeu/ui/listaentrada/lista_entrada.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainEntrada extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider<EntradaApi>(
      create: (context)=>EntradaApi.create(),
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.lightBlue
        ),
        home: ListaEntrada(),
      ),

    );
  }

}