


import 'package:calidad_servicioupeu/api/api_almacen.dart';
import 'package:calidad_servicioupeu/modelo/almacen_modelo.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaAlmacen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Lista Almacen"),),
      ),
      body: _listFutureAlmacen(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var token="Token";

          final prefs= await SharedPreferences.getInstance();


          final api=Provider.of<AlmacenApi>(context, listen: false);
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

  FutureBuilder _listFutureAlmacen(BuildContext context){
    return FutureBuilder<List<ModeloAlmacen>>(
        future: Provider.of<AlmacenApi>(context, listen: false).getAlmacen(),
        builder: (BuildContext context, AsyncSnapshot<List<ModeloAlmacen>>  snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            if(snapshot.hasError){
              return Container(
                child: Center(child: Text("Error al Recuperar Almacen")),
              );
            }
            final almacen=snapshot.data;
            print(almacen.length);
            //Implementar
            return _listAlmacen(context: context, almacen: almacen);
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

  ListView _listAlmacen({BuildContext context, List<ModeloAlmacen> almacen}){
    return ListView.builder(
        itemCount: almacen.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Text(almacen[index].almacenId.toString()),
                title: Text(almacen[index].almacenNombre),
              ),
            ),
          );
        }
    );
  }



}