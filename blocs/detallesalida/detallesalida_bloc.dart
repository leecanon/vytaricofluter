

import 'dart:async';


import 'package:calidad_servicioupeu/modelo/detallesalida_model.dart';
import 'package:calidad_servicioupeu/repository/DetalleSalidaReposiroty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'detallesalida_event.dart';
part 'detallesalida_state.dart';

class DetallesalidaBloc extends Bloc<DetallesalidaEvent, DetallesalidaState> {

  final DetalleSalidaRepository _detallesalidaRepository;

  DetallesalidaBloc({DetalleSalidaRepository detallesalidaRepository})
      :
        _detallesalidaRepository=detallesalidaRepository,
        super(DetallesalidaInitialState());



  @override
  Stream<DetallesalidaState> mapEventToState(DetallesalidaEvent event) async* {
    if (event is ListarDetallesalidaEvent) {
      yield DetallesalidaLoadingState();
      try {
        List<ModeloDetalleSalida> detallesalidaList = await _detallesalidaRepository.getDetallesalida();
        yield DetallesalidaLoadedState(detallesalidaList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield DetallesalidaError(e);
      }
    } else if (event is DeleteDetallesalidaEvent) {
      try {
        await _detallesalidaRepository.deleteDetalleSalida(event.detallesalida.detalleId);
        yield DetallesalidaLoadingState();
        List<ModeloDetalleSalida> detallesalidaList = await _detallesalidaRepository.getDetallesalida();
        yield DetallesalidaLoadedState(detallesalidaList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield DetallesalidaError(e);
      }
    } else if (event is CreateDetallesalidaEvent) {
      try {
        await _detallesalidaRepository.createDetalleSalida(event.detallesalida);
        yield DetallesalidaLoadingState();
        List<ModeloDetalleSalida> detallesalidaList = await _detallesalidaRepository.getDetallesalida();
        yield DetallesalidaLoadedState(detallesalidaList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield DetallesalidaError(e);
      }
    } else if (event is UpdateDetallesalidaEvent) {
      try {
        await _detallesalidaRepository.updateDetalleSalida(
            event.detallesalida.detalleId, event.detallesalida);
        yield DetallesalidaLoadingState();
        List<ModeloDetalleSalida> detallesalidaList = await _detallesalidaRepository.getDetallesalida();
        yield DetallesalidaLoadedState(detallesalidaList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield DetallesalidaError(e);
      }
    }
  }

}

