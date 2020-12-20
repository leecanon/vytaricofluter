


import 'package:calidad_servicioupeu/api/api_detallesalida.dart';
import 'package:calidad_servicioupeu/modelo/detallesalida_model.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaDetallesalida extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Lista Detalle salida"),),
      ),
      body: _listFutureDetallesalida(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var token="Token";

          final prefs= await SharedPreferences.getInstance();

          final api=Provider.of<DetallesalidaApi>(context, listen: false);
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

  FutureBuilder _listFutureDetallesalida(BuildContext context){
    return FutureBuilder<List<ModeloDetalleSalida>>(
        future: Provider.of<DetallesalidaApi>(context, listen: false).getDetallesalida(),
        builder: (BuildContext context, AsyncSnapshot<List<ModeloDetalleSalida>>  snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            if(snapshot.hasError){
              return Container(
                child: Center(child: Text("Error al Recuperar Detalle salida")),
              );
            }
            final detallesalida=snapshot.data;
            print(detallesalida.length);
            //Implementar
            return _listDetallesalida(context: context, detallesalida: detallesalida);
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

  ListView _listDetallesalida({BuildContext context, List<ModeloDetalleSalida> detallesalida}){
    return ListView.builder(
        itemCount: detallesalida.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Text(detallesalida[index].detalleId.toString()),
                title: Text(detallesalida[index].productoId),
              ),
            ),
          );
        }
    );
  }



}