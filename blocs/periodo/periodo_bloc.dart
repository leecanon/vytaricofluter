

import 'dart:async';


import 'package:calidad_servicioupeu/modelo/periodo_modelo.dart';
import 'package:calidad_servicioupeu/repository/PeriodoRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'periodo_event.dart';
part 'periodo_state.dart';

class PeriodoBloc extends Bloc<PeriodoEvent, PeriodoState> {

  final PeriodoRepository _periodoRepository;

  PeriodoBloc({PeriodoRepository periodoRepository})
      :
        _periodoRepository=periodoRepository,
        super(PeriodoInitialState());



  @override
  Stream<PeriodoState> mapEventToState(PeriodoEvent event) async* {
    if (event is ListarPeriodoEvent) {
      yield PeriodoLoadingState();
      try {
        List<ModeloPeriodo> periodoList = await _periodoRepository.getPeriodo();
        yield PeriodoLoadedState(periodoList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield PeriodoError(e);
      }
    } else if (event is DeletePeriodoEvent) {
      try {
        await _periodoRepository.deletePeriodo(event.periodo.idPeriodo);
        yield PeriodoLoadingState();
        List<ModeloPeriodo> periodoList = await _periodoRepository.getPeriodo();
        yield PeriodoLoadedState(periodoList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield PeriodoError(e);
      }
    } else if (event is CreatePeriodoEvent) {
      try {
        await _periodoRepository.createPeriodo(event.periodo);
        yield PeriodoLoadingState();
        List<ModeloPeriodo> periodoList = await _periodoRepository.getPeriodo();
        yield PeriodoLoadedState(periodoList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield PeriodoError(e);
      }
    } else if (event is UpdatePeriodoEvent) {
      try {
        await _periodoRepository.updatePeriodo(
            event.periodo.idPeriodo, event.periodo);
        yield PeriodoLoadingState();
        List<ModeloPeriodo> periodoList = await _periodoRepository.getPeriodo();
        yield PeriodoLoadedState(periodoList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield PeriodoError(e);
      }
    }
  }

}

