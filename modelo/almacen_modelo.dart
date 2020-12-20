

class ModeloAlmacen{
  int almacenId;
  String almacenNombre;
  String almacenDireccion;
  String almacenTelefono;

  ModeloAlmacen({
    this.almacenId, this.almacenNombre, this.almacenDireccion, this.almacenTelefono
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data=new Map<String, dynamic>();
    data['almacenId']=this.almacenId;
    data['almacenNombre']=this.almacenNombre;
    data['almacenDireccion']=this.almacenDireccion;
    data['almacenTelefono']=this.almacenTelefono;
    return data;
  }

  ModeloAlmacen.fromJson(Map<String, dynamic> json){
    //almacenId: json['almacenId'];
    almacenId=json['almacenId'];
    almacenNombre=json['almacenNombre'];
    almacenDireccion=json['almacenDireccion'];
    almacenTelefono=json['almacenTelefono'];
  }

}
