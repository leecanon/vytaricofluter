


import 'package:calidad_servicioupeu/api/api_materiaprima.dart';
import 'package:calidad_servicioupeu/modelo/materiaprima_model.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaMateriaPrima extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Lista Periodo"),),
      ),
      body: _listFutureMateriaprima(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var token="Token";

          final prefs= await SharedPreferences.getInstance();


          final api=Provider.of<MateriaprimaApi>(context, listen: false);
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

  FutureBuilder _listFutureMateriaprima(BuildContext context){
    return FutureBuilder<List<ModeloMateriaPrima>>(
        future: Provider.of<MateriaprimaApi>(context, listen: false).getMateriaprima(),
        builder: (BuildContext context, AsyncSnapshot<List<ModeloMateriaPrima>>  snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            if(snapshot.hasError){
              return Container(
                child: Center(child: Text("Error al Recuperar Materia Prima")),
              );
            }
            final materiaprima=snapshot.data;
            print(materiaprima.length);
            //Implementar
            return _listMateriaprima(context: context, materiaprima: materiaprima);
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

  ListView _listMateriaprima({BuildContext context, List<ModeloMateriaPrima> materiaprima}){
    return ListView.builder(
        itemCount: materiaprima.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Text(materiaprima[index].materiaId.toString()),
                title: Text(materiaprima[index].materiaNombre),
              ),
            ),
          );
        }
    );
  }



}