


part of 'materiaprima_bloc.dart';


class MateriaprimaState{ }

class MateriaprimaInitialState extends MateriaprimaState{ }

class MateriaprimaLoadingState extends MateriaprimaState{}

class MateriaprimaLoadedState extends MateriaprimaState{
  List<ModeloMateriaPrima> materiaprimaList;
  MateriaprimaLoadedState(this.materiaprimaList);
}

class MateriaprimaError extends MateriaprimaState{
  Error e;
  MateriaprimaError(this.e);
}