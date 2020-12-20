

class ModeloDetalleProduccion{

  int detalleId;
  String materiaId;
  double salproId;

  ModeloDetalleProduccion({
    this.detalleId, this.materiaId, this.salproId
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data=new Map<String, dynamic>();
    data['detalleId']=this.detalleId;
    data['materia_id']=this.materiaId;
    data['salproId']=this.salproId;
    return data;
  }

  ModeloDetalleProduccion.fromJson(Map<String, dynamic> json){
    detalleId=json['detalleId'];
    materiaId=json['materiaId'];
    salproId=json['salproId'];
  }

}