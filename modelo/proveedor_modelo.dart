// TODO Implement this library.// TODO Implement this library.
class ModeloProveedor{
  int proveedorId;
  String proveedorNombre;
  String proveedorDireccion;
  String proveedorCorreo;
  String proveedorTelefono;

  ModeloProveedor({
    this.proveedorId,
    this.proveedorNombre,
    this.proveedorDireccion,
    this.proveedorCorreo,
    this.proveedorTelefono,
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data=new Map<String, dynamic>();
    data['proveedorId']=this.proveedorId;
    data['proveedorNombre']=this.proveedorNombre;
    data['proveedorDireccion']=this.proveedorDireccion;
    data['proveedorCorreo']=this.proveedorCorreo;
    data['proveedorTelefono']=this.proveedorTelefono;
    return data;
  }

  ModeloProveedor.fromJson(Map<String, dynamic> json){
    proveedorId=json['proveedorId'];
    proveedorNombre=json['proveedorNombre'];
    proveedorDireccion=json['proveedorDireccion'];
    proveedorCorreo=json['proveedorCorreo'];
    proveedorTelefono=json['proveedorTelefono'];
  }

}