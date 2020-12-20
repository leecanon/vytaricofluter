

part of 'detallesalida_bloc.dart';


abstract class DetallesalidaEvent{
  final ModeloDetalleSalida detallesalida;
  const DetallesalidaEvent({this.detallesalida});
}

class ListarDetallesalidaEvent extends DetallesalidaEvent{ ListarDetallesalidaEvent(); }

class DeleteDetallesalidaEvent extends DetallesalidaEvent{
  DeleteDetallesalidaEvent({@required ModeloDetalleSalida detallesalida}):super(detallesalida:detallesalida);
}

class UpdateDetallesalidaEvent extends DetallesalidaEvent{
  UpdateDetallesalidaEvent({@required ModeloDetalleSalida detallesalida}):super(detallesalida:detallesalida);
}

class CreateDetallesalidaEvent extends DetallesalidaEvent{
  CreateDetallesalidaEvent({@required ModeloDetalleSalida detallesalida}):super(detallesalida:detallesalida);
}