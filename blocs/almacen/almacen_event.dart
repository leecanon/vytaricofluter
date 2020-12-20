

part of 'almacen_bloc.dart';


abstract class AlmacenEvent{
  final ModeloAlmacen almacen;
  const AlmacenEvent({this.almacen});
}

class ListarAlmacenEvent extends AlmacenEvent{ ListarAlmacenEvent(); }

class DeleteAlmacenEvent extends AlmacenEvent{
  DeleteAlmacenEvent({@required ModeloAlmacen almacen}):super(almacen:almacen);
}

class UpdateAlmacenEvent extends AlmacenEvent{
  UpdateAlmacenEvent({@required ModeloAlmacen almacen}):super(almacen:almacen);
}

class CreateAlmacenEvent extends AlmacenEvent{
  CreateAlmacenEvent({@required ModeloAlmacen almacen}):super(almacen:almacen);
}