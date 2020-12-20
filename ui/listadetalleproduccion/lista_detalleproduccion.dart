


import 'package:calidad_servicioupeu/api/api_detalleproduccion.dart';
import 'package:calidad_servicioupeu/modelo/detalleproduccion_model.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaDetalleproduccion extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Lista Detalle Produccion"),),
      ),
      body: _listFutureDetalleproduccion(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var token="Token";

          final prefs= await SharedPreferences.getInstance();

          final api=Provider.of<DetalleproduccionApi>(context, listen: false);
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

  FutureBuilder _listFutureDetalleproduccion(BuildContext context){
    return FutureBuilder<List<ModeloDetalleProduccion>>(
        future: Provider.of<DetalleproduccionApi>(context, listen: false).getDetalleproduccion(),
        builder: (BuildContext context, AsyncSnapshot<List<ModeloDetalleProduccion>>  snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            if(snapshot.hasError){
              return Container(
                child: Center(child: Text("Error al Recuperar Detalle Produccion")),
              );
            }
            final detalleproduccion=snapshot.data;
            print(detalleproduccion.length);
            //Implementar
            return _listDetalleproduccion(context: context, detalleproduccion: detalleproduccion);
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

  ListView _listDetalleproduccion({BuildContext context, List<ModeloDetalleProduccion> detalleproduccion}){
    return ListView.builder(
        itemCount: detalleproduccion.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Text(detalleproduccion[index].detalleId.toString()),
                title: Text(detalleproduccion[index].materiaId),
              ),
            ),
          );
        }
    );
  }



}