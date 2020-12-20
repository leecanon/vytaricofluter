
class ModeloPeriodo{

  int idPeriodo;
  String periodo;
  String estadoPe;

  ModeloPeriodo({this.idPeriodo, this.periodo, this.estadoPe});

  Map<String, dynamic> toJson(){
    final  Map<String, dynamic> data= new Map<String, dynamic>();
    data['idPeriodo']=this.idPeriodo;
    data['periodo']=this.periodo;
    data['estadoPe']=this.estadoPe;
    return data;
  }

  ModeloPeriodo.fromJson(Map<String, dynamic> json){
    idPeriodo=json['idPeriodo'];
    periodo=json['periodo'];
    estadoPe=json['estadoPe'];
  }

}