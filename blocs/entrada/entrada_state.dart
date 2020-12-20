
part of 'entrada_bloc.dart';

class EntradaState{ }

class EntradaInitialState extends EntradaState{ }

class EntradaLoadingState extends EntradaState{}

class EntradaLoadedState extends EntradaState{
  List<ModeloEntrada> entradaList;
  EntradaLoadedState(this.entradaList);
}

class EntradaError extends EntradaState{
  Error e;
  EntradaError(this.e);
}