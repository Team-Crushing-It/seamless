import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'main_state.dart';

/// {@template page_cubit}
/// A [Cubit] which manages an [MainState] as its state. Honestly, I'm faking it
/// till I make it.
/// {@endtemplate}

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  // AnimationController _colorAnimationController;
  // Animation _colorTween;

  void scrollPozish(double pos) => {
        print(pos),
        // _colorAnimationController.animateTo(pos / 100),
      };
}
