


part of 'detallesalida_bloc.dart';

class DetallesalidaState{ }

class DetallesalidaInitialState extends DetallesalidaState{ }

class DetallesalidaLoadingState extends DetallesalidaState{}

class DetallesalidaLoadedState extends DetallesalidaState{
  List<ModeloDetalleSalida> detallesalidaList;
  DetallesalidaLoadedState(this.detallesalidaList);
}

class DetallesalidaError extends DetallesalidaState{
  Error e;
  DetallesalidaError(this.e);
}