


import 'package:calidad_servicioupeu/blocs/almacen/almacen_bloc.dart';
import 'package:calidad_servicioupeu/blocs/ticker/ticker_bloc.dart';
import 'package:calidad_servicioupeu/modelo/almacen_modelo.dart';
import 'package:calidad_servicioupeu/repository/AlmacenRepository.dart';
import 'package:calidad_servicioupeu/repository/ticker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_float_action_button/animated_floating_action_button.dart';
class TickerAlmacenApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>TickerBloc(Ticker())),
          BlocProvider(create: (_)=>AlmacenBloc( almacenRepository : AlmacenRepository())),
        ],
        child: MaterialApp(
          theme: ThemeData(primaryColor: Colors.amberAccent),
          home: TickerPage(),
        ));
  }

}


class TickerPage extends StatelessWidget{
  final controllerAlmacenId=new TextEditingController();
  final controllerAlmacenNombre=new TextEditingController();
  final controllerAlmacenTelefono=new TextEditingController();
  final controllerAlmacenDireccion=new TextEditingController();

  final GlobalKey<AnimatedFloatingActionButtonState> fabKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AlmacenBloc>(context).add(ListarAlmacenEvent());
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
                final almacen=new ModeloAlmacen();
                formDialog(context, almacen);
                print("Si funciona 2");
              },
              child: Icon(Icons.add_box_sharp),
            ),
          )
        ],
      ),
      body: BlocBuilder<AlmacenBloc, AlmacenState>(
        builder: (context, state){
          if(state is AlmacenLoadedState){
            /*return Center(
              child: Text("Tick #${state.productosList.length}"),
            );*/

            return ListView.builder(
              itemCount: state.almacenList.length,
              itemBuilder: (context, index)=>
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: Text(state.almacenList[index].almacenId.toString()),
                        title: Text(state.almacenList[index].almacenNombre),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(icon: Icon(Icons.edit), onPressed: (){
                              ModeloAlmacen almacen=state.almacenList[index];
                              controllerAlmacenId.text=almacen.almacenId.toString();
                              controllerAlmacenNombre.text=almacen.almacenNombre;
                              controllerAlmacenDireccion.text=almacen.almacenDireccion;
                              controllerAlmacenTelefono.text=almacen.almacenTelefono;
                              formDialog(context, almacen);
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
                                  BlocProvider.of<AlmacenBloc>(context).add(DeleteAlmacenEvent(almacen: state.almacenList[index]));
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
        context.read<AlmacenBloc>().add(ListarAlmacenEvent());
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


  Future formDialog(BuildContext context, ModeloAlmacen almacen){
    return showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Crear almacen"),
            content: Column(
              children: [
                TextField(
                  obscureText: false,
                  controller: controllerAlmacenNombre,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Estado:",
                  ),
                ),
                TextField(
                  obscureText: false,
                  controller: controllerAlmacenDireccion,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Estado:",
                  ),
                ),
                TextField(
                  obscureText: false,
                  controller: controllerAlmacenTelefono,
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
                    //almacen.almacenId=int.parse(controllerAlmacenId.value.text.toString());
                    almacen.almacenNombre=controllerAlmacenNombre.value.text;
                    almacen.almacenTelefono=controllerAlmacenTelefono.value.text;
                    almacen.almacenDireccion=controllerAlmacenDireccion.value.text;
                    controllerAlmacenId.clear();
                    Navigator.of(context).pop(almacen);
                  })
            ],
          );
        }
    ).then((value){
      if(value.toString()!="Cencel" && value.toString()!=null){
        ModeloAlmacen data=value;
        print("VER: ${data.almacenId}" );
        if(data.almacenId==null){
          print("Datos: ${data.almacenNombre}-${data.almacenDireccion}-${data.almacenTelefono}");
          BlocProvider.of<AlmacenBloc>(context).add(CreateAlmacenEvent(almacen: data));
        }else{
          BlocProvider.of<AlmacenBloc>(context).add(UpdateAlmacenEvent(almacen: data));
        }
      }
    });
  }


}