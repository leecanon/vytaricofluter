

part of 'periodo_bloc.dart';


abstract class PeriodoEvent{
  final ModeloPeriodo periodo;
  const PeriodoEvent({this.periodo});
}

class ListarPeriodoEvent extends PeriodoEvent{ ListarPeriodoEvent(); }

class DeletePeriodoEvent extends PeriodoEvent{
  DeletePeriodoEvent({@required ModeloPeriodo periodo}):super(periodo:periodo);
}

class UpdatePeriodoEvent extends PeriodoEvent{
  UpdatePeriodoEvent({@required ModeloPeriodo periodo}):super(periodo:periodo);
}

class CreatePeriodoEvent extends PeriodoEvent{
  CreatePeriodoEvent({@required ModeloPeriodo periodo}):super(periodo:periodo);
}