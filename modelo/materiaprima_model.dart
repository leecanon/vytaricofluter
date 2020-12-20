
import 'package:calidad_servicioupeu/modelo/almacen_modelo.dart';

class ModeloMateriaPrima{

  int materiaId;
  String materiaNombre;
  String materiaCantidad;
  String materiaIngreso;
  ModeloAlmacen almacenId;

  ModeloMateriaPrima({
    this.materiaId,
    this.materiaNombre,
    this.materiaCantidad,
    this.materiaIngreso,
    this.almacenId});

  Map<String, dynamic> toJson(){
    final  Map<String, dynamic> data= new Map<String, dynamic>();
   // data['materiaId']=this.materiaId.toJson();

    data['almacenId']=this.almacenId.toJson();
    data['materiaId']=this.materiaId;
    data['materiaNombre']=this.materiaNombre;
    data['materiaCantidad']=this.materiaCantidad;
    data['materiaIngreso']=this.materiaIngreso;


    //data['almacenId']=this.almacenId;
    return data;
  }

  ModeloMateriaPrima.fromJson(Map<String, dynamic> json){
    almacenId=ModeloAlmacen.fromJson(json['almacenId']);
    materiaId=json['materiaId'];
    materiaNombre=json['materiaNombre'];
    materiaCantidad=json['materiaCantidad'];
    materiaIngreso=json['materiaIngreso'];

  }

}