
import 'package:calidad_servicioupeu/modelo/materiaprima_model.dart';
import 'package:calidad_servicioupeu/modelo/proveedor_modelo.dart';

class ModeloPedido{
  int pedidoId;
  String pedidoFecha;
  ModeloProveedor proveedorId;

  ModeloPedido({
    this.pedidoId, this.pedidoFecha, this.proveedorId
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data=new Map<String, dynamic>();
    data['pedidoId']=this.pedidoId;
    data['pedidoFecha']=this.pedidoFecha;
    data['proveedorId']=this.proveedorId.toJson();
    return data;
  }

  ModeloPedido.fromJson(Map<String, dynamic> json){
    pedidoId=json['pedidoId'];
    pedidoFecha=json['pedidoFecha'];
    proveedorId=ModeloProveedor.fromJson(json['proveedorId']);
  }

}