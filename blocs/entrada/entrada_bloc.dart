

import 'dart:async';


import 'package:calidad_servicioupeu/modelo/entrada_modelo.dart';
import 'package:calidad_servicioupeu/repository/EntradaRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'entrada_event.dart';
part 'entrada_state.dart';

class EntradaBloc extends Bloc<EntradaEvent, EntradaState> {

  final EntradaRepository _entradaRepository;

  EntradaBloc({EntradaRepository entradaRepository})
      :
        _entradaRepository=entradaRepository,
        super(EntradaInitialState());



  @override
  Stream<EntradaState> mapEventToState(EntradaEvent event) async* {
    if (event is ListarEntradaEvent) {
      yield EntradaLoadingState();
      try {
        List<ModeloEntrada>  entradaList = await _entradaRepository.getEntrada();
        yield EntradaLoadedState(entradaList);
      } catch (e) {
        print("Error x ${e.toString()}");
        yield EntradaError(e);
      }
    } else if (event is DeleteEntradaEvent) {
      try {
        await _entradaRepository.deleteEntrada(event.entrada.detalleId);
        yield EntradaLoadingState();
        List<ModeloEntrada> entradaList = await _entradaRepository.getEntrada();
        yield EntradaLoadedState(entradaList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield EntradaError(e);
      }
    } else if (event is CreateEntradaEvent) {
      try {
        await _entradaRepository.createEntrada(event.entrada);
        yield EntradaLoadingState();
        List<ModeloEntrada> entradaList = await _entradaRepository.getEntrada();
        yield EntradaLoadedState(entradaList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield EntradaError(e);
      }
    } else if (event is UpdateEntradaEvent) {
      try {
        await _entradaRepository.updateEntrada(
            event.entrada.detalleId, event.entrada);
        yield EntradaLoadingState();
        List<ModeloEntrada> entradaList = await _entradaRepository.getEntrada();
        yield EntradaLoadedState(entradaList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield EntradaError(e);
      }
    }
  }

}

