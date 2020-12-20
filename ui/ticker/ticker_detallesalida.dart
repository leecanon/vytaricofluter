

import 'package:calidad_servicioupeu/blocs/detallesalida/detallesalida_bloc.dart';
import 'package:calidad_servicioupeu/blocs/ticker/ticker_bloc.dart';
import 'package:calidad_servicioupeu/modelo/detallesalida_model.dart';
import 'package:calidad_servicioupeu/repository/DetalleSalidaReposiroty.dart';
import 'package:calidad_servicioupeu/repository/ticker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_float_action_button/animated_floating_action_button.dart';
class TickerDetalleSalidaApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>TickerBloc(Ticker())),
          BlocProvider(create: (_)=>DetallesalidaBloc( detallesalidaRepository : DetalleSalidaRepository())),
        ],
        child: MaterialApp(
          theme: ThemeData(primaryColor: Colors.amberAccent),
          home: TickerPage(),
        ));
  }

}


class TickerPage extends StatelessWidget{
  final controllerDetallesalida=new TextEditingController();
  final controllerProductoId=new TextEditingController();
  final controllerSalidaId=new TextEditingController();
  final GlobalKey<AnimatedFloatingActionButtonState> fabKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DetallesalidaBloc>(context).add(ListarDetallesalidaEvent());
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
              child: Text(" Titulo"),
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
                final detallesalida=new ModeloDetalleSalida();
                formDialog(context, detallesalida);
                print("Si funciona 2");
              },
              child: Icon(Icons.add_box_sharp),
            ),
          )
        ],
      ),
      body: BlocBuilder<DetallesalidaBloc, DetallesalidaState>(
        builder: (context, state){
          if(state is DetallesalidaLoadedState){
            /*return Center(
              child: Text("Tick #${state.productosList.length}"),
            );*/

            return ListView.builder(
              itemCount: state.detallesalidaList.length,
              itemBuilder: (context, index)=>
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: Text(state.detallesalidaList[index].detalleId.toString()),
                        title: Text(state.detallesalidaList[index].productoId),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(icon: Icon(Icons.edit), onPressed: (){
                              ModeloDetalleSalida detallesalida=state.detallesalidaList[index];
                              controllerDetallesalida.text=detallesalida.detalleId.toString();
                              controllerProductoId.text=detallesalida.productoId.toString();
                              controllerSalidaId.text=detallesalida.salidaId.toString();
                              formDialog(context, detallesalida);
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
                                  BlocProvider.of<DetallesalidaBloc>(context).add(DeleteDetallesalidaEvent(detallesalida: state.detallesalidaList[index]));
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
        context.read<DetallesalidaBloc>().add(ListarDetallesalidaEvent());
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


  Future formDialog(BuildContext context, ModeloDetalleSalida detallesalida){
    return showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Crear detalle produccion"),
            content: Column(
              children: [
                TextField(
                  obscureText: false,
                  controller: controllerDetallesalida,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Detalle produccion:",
                  ),
                ),
                TextField(
                  obscureText: false,
                  controller: controllerProductoId,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Estado:",
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
                    //detallesalida.detalleId=int.parse(controllerDetallesalida.value.text);
                    detallesalida.productoId=controllerProductoId.value.text;
                    //detallesalida.salidaId=int.parse(controllerSalidaId.value.text);
                    controllerDetallesalida.clear();
                    controllerDetallesalida.clear();
                    Navigator.of(context).pop(detallesalida);
                  })
            ],
          );
        }
    ).then((value){
      if(value.toString()!="Cencel" && value.toString()!=null){
        ModeloDetalleSalida data=value;
        print("VER: ${data.detalleId}" );
        if(data.detalleId==null){
          print("Datos: ${data.productoId}-${data.salidaId}");
          BlocProvider.of<DetallesalidaBloc>(context).add(CreateDetallesalidaEvent(detallesalida: data));
        }else{
          BlocProvider.of<DetallesalidaBloc>(context).add(UpdateDetallesalidaEvent(detallesalida: data));
        }
      }
    });
  }


}