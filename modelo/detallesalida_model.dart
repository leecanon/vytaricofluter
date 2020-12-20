
class ModeloDetalleSalida{

  int detalleId;
  String productoId;
  double salidaId;

  ModeloDetalleSalida({
    this.detalleId, this.productoId, this.salidaId
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data=new Map<String, dynamic>();
    data['detalleId']=this.detalleId;
    data['productoId']=this.productoId;
    data['salidaId']=this.salidaId;
    return data;
  }

  ModeloDetalleSalida.fromJson(Map<String, dynamic> json){
    detalleId=json['detalleId'];
    productoId=json['productoId'];
    salidaId=json['salidaId'];
  }

}