

import 'dart:async';


import 'package:calidad_servicioupeu/modelo/detalleproduccion_model.dart';
import 'package:calidad_servicioupeu/repository/DetalleProduccionRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'detalleproduccion_event.dart';
part 'detalleproduccion_state.dart';

class DetalleproduccionBloc extends Bloc<DetalleproduccionEvent, DetalleproduccionState> {

  final DetalleProduccionRepository _detalleproduccionRepository;

  DetalleproduccionBloc({DetalleProduccionRepository detalleproduccionRepository})
      :
        _detalleproduccionRepository=detalleproduccionRepository,
        super(DetalleproduccionInitialState());



  @override
  Stream<DetalleproduccionState> mapEventToState(DetalleproduccionEvent event) async* {
    if (event is ListarDetalleproduccionEvent) {
      yield DetalleproduccionLoadingState();
      try {
        List<ModeloDetalleProduccion>  detalleproduccionList = await _detalleproduccionRepository.getDetalleproduccion();
        yield DetalleProduccionLoadedState(detalleproduccionList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield DetalleproduccionError(e);
      }
    } else if (event is DeleteDetalleproduccionEvent) {
      try {
        await _detalleproduccionRepository.deleteDetalleproduccion(event.detalleproduccion.detalleId);
        yield DetalleproduccionLoadingState();
        List<ModeloDetalleProduccion> detalleproduccionList = await _detalleproduccionRepository.getDetalleproduccion();
        yield DetalleProduccionLoadedState(detalleproduccionList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield DetalleproduccionError(e);
      }
    } else if (event is CreateDetalleproduccionEvent) {
      try {
        await _detalleproduccionRepository.createDetalleproduccion(event.detalleproduccion);
        yield DetalleproduccionLoadingState();
        List<ModeloDetalleProduccion> detalleproduccionList = await _detalleproduccionRepository.getDetalleproduccion();
        yield DetalleProduccionLoadedState(detalleproduccionList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield DetalleproduccionError(e);
      }
    } else if (event is UpdateDetalleproduccionEvent) {
      try {
        await _detalleproduccionRepository.updateDetalleproduccion(
            event.detalleproduccion.detalleId, event.detalleproduccion);
        yield DetalleproduccionLoadingState();
        List<ModeloDetalleProduccion> detalleproduccionList = await _detalleproduccionRepository.getDetalleproduccion();
        yield DetalleProduccionLoadedState(detalleproduccionList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield DetalleproduccionError(e);
      }
    }
  }

}

