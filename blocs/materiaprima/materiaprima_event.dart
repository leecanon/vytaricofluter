

part of 'materiaprima_bloc.dart';



abstract class MateriaprimaEvent{
  final ModeloMateriaPrima materiaprima;
  const MateriaprimaEvent({this.materiaprima});
}

class ListarMateriaprimaEvent extends MateriaprimaEvent{ ListarMateriaprimaEvent(); }

class DeleteMateriaprimaEvent extends MateriaprimaEvent{
  DeleteMateriaprimaEvent({@required ModeloMateriaPrima materiaprima}):super(materiaprima:materiaprima);
}

class UpdateMateriaprimaEvent extends MateriaprimaEvent{
  UpdateMateriaprimaEvent({@required ModeloMateriaPrima materiaprima}):super(materiaprima:materiaprima);
}

class CreateMateriaprimaEvent extends MateriaprimaEvent{
  CreateMateriaprimaEvent({@required ModeloMateriaPrima materiaprima}):super(materiaprima:materiaprima);
}