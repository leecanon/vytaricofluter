

import 'dart:async';


import 'package:calidad_servicioupeu/modelo/almacen_modelo.dart';
import 'package:calidad_servicioupeu/repository/AlmacenRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'almacen_event.dart';
part 'almacen_state.dart';

class AlmacenBloc extends Bloc<AlmacenEvent, AlmacenState> {

  final AlmacenRepository _almacenRepository;

  AlmacenBloc({AlmacenRepository almacenRepository})
      :
        _almacenRepository=almacenRepository,
        super(AlmacenInitialState());



  @override
  Stream<AlmacenState> mapEventToState(AlmacenEvent event) async* {
    if (event is ListarAlmacenEvent) {
      yield AlmacenLoadingState();
      try {
        List<ModeloAlmacen>  almacenList = await _almacenRepository.getAlmacen();
        yield AlmacenLoadedState(almacenList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield AlmacenError(e);
      }
    } else if (event is DeleteAlmacenEvent) {
      try {
        await _almacenRepository.deleteAlmacen(event.almacen.almacenId);
        yield AlmacenLoadingState();
        List<ModeloAlmacen> almacenList = await _almacenRepository.getAlmacen();
        yield AlmacenLoadedState(almacenList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield AlmacenError(e);
      }
    } else if (event is CreateAlmacenEvent) {
      try {
        await _almacenRepository.createAlmacen(event.almacen);
        yield AlmacenLoadingState();
        List<ModeloAlmacen> almacenList = await _almacenRepository.getAlmacen();
        yield AlmacenLoadedState(almacenList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield AlmacenError(e);
      }
    } else if (event is UpdateAlmacenEvent) {
      try {
        await _almacenRepository.updateAlmacen(
            event.almacen.almacenId, event.almacen);
        yield AlmacenLoadingState();
        List<ModeloAlmacen> almacenList = await _almacenRepository.getAlmacen();
        yield AlmacenLoadedState(almacenList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield AlmacenError(e);
      }
    }
  }

}

