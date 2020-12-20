


import 'package:calidad_servicioupeu/api/api_periodo.dart';
import 'package:calidad_servicioupeu/ui/listaperiodo/lista_periodo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPeriodo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider<PeriodoApi>(
      create: (context)=>PeriodoApi.create(),
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.lightBlue
        ),
        home: ListaPeriodo(),
      ),

    );
  }

}