

import 'dart:async';


import 'package:calidad_servicioupeu/modelo/materiaprima_model.dart';
import 'package:calidad_servicioupeu/repository/MateriaPrimaRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'materiaprima_event.dart';
part 'materiaprima_state.dart';

class MateriaprimaBloc extends Bloc<MateriaprimaEvent, MateriaprimaState> {

  final MateriaPrimaRepository _materiaprimaRepository;

  MateriaprimaBloc({MateriaPrimaRepository materiaprimaRepository})
      :
        _materiaprimaRepository=materiaprimaRepository,
        super(MateriaprimaInitialState());



  @override
  Stream<MateriaprimaState> mapEventToState(MateriaprimaEvent event) async* {
    if (event is ListarMateriaprimaEvent) {
      yield MateriaprimaLoadingState();
      try {
        List<ModeloMateriaPrima> materiaprimaList = await _materiaprimaRepository.getMateriaprima();
        yield MateriaprimaLoadedState(materiaprimaList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield MateriaprimaError(e);
      }
    } else if (event is DeleteMateriaprimaEvent) {
      try {
        await _materiaprimaRepository.deleteMateriaprima(event.materiaprima.materiaId);
        yield MateriaprimaLoadingState();
        List<ModeloMateriaPrima> materiaprimaList = await _materiaprimaRepository.getMateriaprima();
        yield MateriaprimaLoadedState(materiaprimaList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield MateriaprimaError(e);
      }
    } else if (event is CreateMateriaprimaEvent) {
      try {
        await _materiaprimaRepository.createMateriaprima(event.materiaprima);
        yield MateriaprimaLoadingState();
        List<ModeloMateriaPrima> materiaprimaList = await _materiaprimaRepository.getMateriaprima();
        yield MateriaprimaLoadedState(materiaprimaList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield MateriaprimaError(e);
      }
    } else if (event is UpdateMateriaprimaEvent) {
      try {
        await _materiaprimaRepository.updateMateriaprima(
            event.materiaprima.materiaId, event.materiaprima);
        yield MateriaprimaLoadingState();
        List<ModeloMateriaPrima> materiaprimaList = await _materiaprimaRepository.getMateriaprima();
        yield MateriaprimaLoadedState(materiaprimaList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield MateriaprimaError(e);
      }
    }
  }

}

