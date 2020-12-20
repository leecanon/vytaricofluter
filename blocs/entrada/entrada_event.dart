

part of 'entrada_bloc.dart';


abstract class EntradaEvent{
  final ModeloEntrada entrada;
  const EntradaEvent({this.entrada});
}

class ListarEntradaEvent extends EntradaEvent{ ListarEntradaEvent(); }

class DeleteEntradaEvent extends EntradaEvent{
  DeleteEntradaEvent({@required ModeloEntrada entrada}):super(entrada:entrada);
}

class UpdateEntradaEvent extends EntradaEvent{
  UpdateEntradaEvent({@required ModeloEntrada entrada}):super(entrada:entrada);
}

class CreateEntradaEvent extends EntradaEvent{
  CreateEntradaEvent({@required ModeloEntrada entrada}):super(entrada:entrada);
}