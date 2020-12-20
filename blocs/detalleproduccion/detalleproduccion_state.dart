


part of 'detalleproduccion_bloc.dart';

class DetalleproduccionState{ }

class DetalleproduccionInitialState extends DetalleproduccionState{ }

class DetalleproduccionLoadingState extends DetalleproduccionState{}

class DetalleProduccionLoadedState extends DetalleproduccionState{
  List<ModeloDetalleProduccion> detalleproduccionList;
  DetalleProduccionLoadedState(this.detalleproduccionList);
}

class DetalleproduccionError extends DetalleproduccionState{
  Error e;
  DetalleproduccionError(this.e);
}