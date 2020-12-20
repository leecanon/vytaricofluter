


import 'package:calidad_servicioupeu/api/api_periodo.dart';
import 'package:calidad_servicioupeu/modelo/periodo_modelo.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaPeriodo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Lista Periodo"),),
      ),
      body: _listFuturePeriodo(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var token="Token";

          final prefs= await SharedPreferences.getInstance();


          final api=Provider.of<PeriodoApi>(context, listen: false);
          final usuario=new ModeloUsuario();
          usuario.nombreUsuario="admin";
          usuario.password="admin";


          api.login(usuario).then((value) {

            print("Probando"+value.nombreUsuario);
            token=value.bearer+" "+value.token;
            prefs.setString("token", token);
          }).catchError((onError){
            print(onError.toString());
          });

        },
        child: Icon(Icons.account_balance),
      ),
    );
  }

  FutureBuilder _listFuturePeriodo(BuildContext context){
    return FutureBuilder<List<ModeloPeriodo>>(
        future: Provider.of<PeriodoApi>(context, listen: false).getPeriodo(),
        builder: (BuildContext context, AsyncSnapshot<List<ModeloPeriodo>>  snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            if(snapshot.hasError){
              return Container(
                child: Center(child: Text("Error al Recuperar Periodo")),
              );
            }
            final periodo=snapshot.data;
            print(periodo.length);
            //Implementar
            return _listPeriodo(context: context, periodo: periodo);
          }else{
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }
    );
  }

  ListView _listPeriodo({BuildContext context, List<ModeloPeriodo> periodo}){
    return ListView.builder(
        itemCount: periodo.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Text(periodo[index].idPeriodo.toString()),
                title: Text(periodo[index].estadoPe),
              ),
            ),
          );
        }
    );
  }



}