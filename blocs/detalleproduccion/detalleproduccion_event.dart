

part of 'detalleproduccion_bloc.dart';


abstract class DetalleproduccionEvent{
  final ModeloDetalleProduccion detalleproduccion;
  const DetalleproduccionEvent({this.detalleproduccion});
}

class ListarDetalleproduccionEvent extends DetalleproduccionEvent{ ListarDetalleproduccionEvent(); }

class DeleteDetalleproduccionEvent extends DetalleproduccionEvent{
  DeleteDetalleproduccionEvent({@required ModeloDetalleProduccion detalleproduccion}):super(detalleproduccion:detalleproduccion);
}

class UpdateDetalleproduccionEvent extends DetalleproduccionEvent{
  UpdateDetalleproduccionEvent({@required ModeloDetalleProduccion detalleproduccion}):super(detalleproduccion:detalleproduccion);
}

class CreateDetalleproduccionEvent extends DetalleproduccionEvent{
  CreateDetalleproduccionEvent({@required ModeloDetalleProduccion detalleproduccion}):super(detalleproduccion:detalleproduccion);
}