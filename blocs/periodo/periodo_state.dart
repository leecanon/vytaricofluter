


part of 'periodo_bloc.dart';

class PeriodoState{ }

class PeriodoInitialState extends PeriodoState{ }

class PeriodoLoadingState extends PeriodoState{}

class PeriodoLoadedState extends PeriodoState{
  List<ModeloPeriodo> periodoList;
  PeriodoLoadedState(this.periodoList);
}

class PeriodoError extends PeriodoState{
  Error e;
  PeriodoError(this.e);
}