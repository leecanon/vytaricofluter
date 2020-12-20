

import 'package:calidad_servicioupeu/blocs/entrada/entrada_bloc.dart';
import 'package:calidad_servicioupeu/blocs/ticker/ticker_bloc.dart';
import 'package:calidad_servicioupeu/modelo/entrada_modelo.dart';
import 'package:calidad_servicioupeu/repository/EntradaRepository.dart';
import 'package:calidad_servicioupeu/repository/ticker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_float_action_button/animated_floating_action_button.dart';
class TickerEntradaApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>TickerBloc(Ticker())),
          BlocProvider(create: (_)=>EntradaBloc( entradaRepository : EntradaRepository())),
        ],
        child: MaterialApp(
          theme: ThemeData(primaryColor: Colors.amberAccent),
          home: TickerPage(),
        ));
  }

}


class TickerPage extends StatelessWidget{
  final controllerEntradaId=new TextEditingController();
  final controllerMateriaId=new TextEditingController();
  final controllerPedidoId=new TextEditingController();

  final GlobalKey<AnimatedFloatingActionButtonState> fabKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EntradaBloc>(context).add(ListarEntradaEvent());
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<TickerBloc, TickerState>(
          builder: (context, state){
            if(state is TickerTickSusccess){
              return Center(
                child: Text("Titulos Tick #${state.count}"),
              );
            }
            return const Center(
              child: Text(" Titulo listar entrada"),
            );
          },
        ),
        actions: <Widget>[
          Padding(padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: (){
                print("Si funciona");
              },
              child: Icon(Icons.search, size: 26.0,),
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: (){
                final entrada=new ModeloEntrada();
                formDialog(context, entrada);
                print("Si funciona 2");
              },
              child: Icon(Icons.add_box_sharp),
            ),
          )
        ],
      ),
      body: BlocBuilder<EntradaBloc, EntradaState>(
        builder: (context, state){
          print (' enter ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
          if(state is EntradaLoadedState){
            /*return Center(
              child: Text("Tick #${state.productosList.length}"),
            );*/

            return ListView.builder(
              itemCount: state.entradaList.length,
              itemBuilder: (context, index)=>
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: Text(state.entradaList[index].detalleId.toString()),
                        title: Text(state.entradaList[index].materiaId.toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(icon: Icon(Icons.edit), onPressed: (){
                              ModeloEntrada entrada=state.entradaList[index];
                              controllerEntradaId.text=entrada.detalleId.toString();
                              controllerMateriaId.text=entrada.materiaId.materiaId.toString();
                              controllerPedidoId.text=entrada.pedidoId.toString();
                              formDialog(context, entrada);
                            }),
                            IconButton(icon: Icon(Icons.delete), onPressed: (){
                              showDialog(context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context){
                                    return AlertDialog(
                                      title: Text("Mensaje de confirmacion"),
                                      content: Text("Desea Eliminar?"),
                                      actions: [
                                        FlatButton(child: const Text('CANCEL'),
                                          onPressed: (){
                                            Navigator.of(context).pop('Failure');
                                          },
                                        ),
                                        FlatButton( child: const Text('ACCEPT'),
                                            onPressed: (){
                                              Navigator.of(context).pop('Success');
                                            })
                                      ],
                                    );
                                  }
                              ).then((value){
                                if(value.toString()=="Success"){
                                  BlocProvider.of<EntradaBloc>(context).add(DeleteEntradaEvent(entrada: state.entradaList[index]));
                                }
                              });




                            })
                          ],
                        ),
                      ),
                    ),
                  ),
            );

          }
          return const Center(

            child: Text("Aqui va la numeracion de incremento"),
          );
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text("Home")),
          BottomNavigationBarItem(icon: new Icon(Icons.email), title: new Text("MSG")),
          BottomNavigationBarItem(icon: new Icon(Icons.person), title: new Text("Perfil")),
        ],
      ),

      floatingActionButton: AnimatedFloatingActionButton(
        key: fabKey,
        fabButtons: <Widget>[
          add(context),
          image(),
          inbox()
        ],
        colorStartAnimation: Colors.blue,
        colorEndAnimation: Colors.red,
        animatedIconData: AnimatedIcons.menu_close,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
    );
  }


  Widget add(BuildContext context) {
    return FloatActionButtonText(
      onPressed: (){
        context.read<TickerBloc>().add(TickerStarted());
        context.read<EntradaBloc>().add(ListarEntradaEvent());
        fabKey.currentState.animate();
      },
      icon: Icons.add,
      text: "Listar/Start Timer",
      textLeft: -150,
    );
  }

  Widget image() {
    return FloatActionButtonText(
      onPressed: (){
        fabKey.currentState.animate();
      },
      icon: Icons.image,
      textLeft: -150,
      text: "Visualizar Rota",
    );
  }

  Widget inbox() {
    return FloatActionButtonText(
      onPressed: (){
        fabKey.currentState.animate();
      },
      icon: Icons.inbox,
      textLeft: -135,
      text: "Desbloquear",
    );
  }


  Future formDialog(BuildContext context, ModeloEntrada entrada){
    return showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Crear entrada"),
            content: Column(
              children: [
                TextField(
                  obscureText: false,
                  controller: controllerMateriaId,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Estado:",
                  ),
                ),
                TextField(
                  obscureText: false,
                  controller: controllerPedidoId,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Entrada:",
                  ),
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(child: Text('CANCEL'),
                  onPressed: (){
                    Navigator.of(context).pop('Cencel');
                  }),

              FlatButton(child: Text('Guardar'),
                  onPressed: (){
                    //print('entrada: +++++++++++++++++++ ${int.parse(controllerMateriaId.value.text.toString())}');
                    entrada.materiaId.materiaId=int.parse(controllerMateriaId.value.text.toString());
                    //var listado = controllerMateriaId
                    //entrada.materiaId.materiaId=int.parse(controllerMateriaId.value.text.toString());
                    entrada.pedidoId.pedidoId=int.parse(controllerPedidoId.value.text.toString());
                    
                    print('entrada: +++++++++++++++++++ ${int.parse(controllerMateriaId.value.text.toString())}');

                    //controllerEntradaId.clear();
                    Navigator.of(context).pop(entrada);
                  })
            ],
          );
        }
    ).then((value){
      print('asdasd');
      if(value.toString()!="Cencel" && value.toString()!=null){
        ModeloEntrada data=value;
        print("VER yyyyyyyyyy: ${data.detalleId}" );
        if(data.detalleId==null){
          print("Datos: ${data.pedidoId}-${data.materiaId}");
          BlocProvider.of<EntradaBloc>(context).add(CreateEntradaEvent(entrada: data));
        }else{
          BlocProvider.of<EntradaBloc>(context).add(UpdateEntradaEvent(entrada: data));
        }
      }
    });
  }


}