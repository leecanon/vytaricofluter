
part of 'almacen_bloc.dart';

class AlmacenState{ }

class AlmacenInitialState extends AlmacenState{ }

class AlmacenLoadingState extends AlmacenState{}

class AlmacenLoadedState extends AlmacenState{
  List<ModeloAlmacen> almacenList;
  AlmacenLoadedState(this.almacenList);
}

class AlmacenError extends AlmacenState{
  Error e;
  AlmacenError(this.e);
}