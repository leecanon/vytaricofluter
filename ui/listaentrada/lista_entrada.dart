


import 'package:calidad_servicioupeu/api/api_entrada.dart';
import 'package:calidad_servicioupeu/modelo/entrada_modelo.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaEntrada extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Lista Entrada"),),
      ),
      body: _listFutureEntrada(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var token="Token";

          final prefs= await SharedPreferences.getInstance();

          final api=Provider.of<EntradaApi>(context, listen: false);
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

  FutureBuilder _listFutureEntrada(BuildContext context){
    return FutureBuilder<List<ModeloEntrada>>(
        future: Provider.of<EntradaApi>(context, listen: false).getEntrada(),
        builder: (BuildContext context, AsyncSnapshot<List<ModeloEntrada>>  snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            if(snapshot.hasError){
              return Container(
                child: Center(child: Text("Error al Recuperar Entrada")),
              );
            }
            final entrada=snapshot.data;
            print(entrada.length);
            //Implementar
            return _listEntrada(context: context, entrada: entrada);
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

  ListView _listEntrada({BuildContext context, List<ModeloEntrada> entrada}){
    print('entrada');
    return ListView.builder(
        itemCount: entrada.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Container(
              padding: EdgeInsets.all(50.0),
              child: ListTile(
                leading: Text(entrada[index].detalleId.toString()),
               // leading: Text(entrada[context].detalle_id.toString()),
              //  title: Text(entrada[index].materia_id),
              ),
            ),
          );
        }
    );
  }



}