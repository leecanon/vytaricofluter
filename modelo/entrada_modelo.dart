
import 'package:calidad_servicioupeu/modelo/materiaprima_model.dart';
import 'package:calidad_servicioupeu/modelo/pedido_modelo.dart';

class ModeloEntrada{
  int detalleId;
  ModeloMateriaPrima materiaId;
  ModeloPedido pedidoId;

  ModeloEntrada({
    this.detalleId, this.materiaId, this.pedidoId
  });


  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data=new Map<String, dynamic>();
    data['detalleId']=this.detalleId;
    data['materiaId']=this.materiaId.toJson();
    data['pedidoId']=this.pedidoId.toJson();
    //"materiaId": materiaId.toJson(),
    //"pedidoId": pedidoId.toJson(),
    return data;
  }

  ModeloEntrada.fromJson(Map<String, dynamic> json){
    detalleId=json['detalleId'];
    materiaId= ModeloMateriaPrima.fromJson(json['materiaId']);
    pedidoId= ModeloPedido.fromJson(json['pedidoId']);
  }

}