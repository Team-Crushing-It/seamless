import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'main_state.dart';

/// {@template page_cubit}
/// A [Cubit] which manages an [MainState] as its state. Honestly, I'm faking it
/// till I make it.
/// {@endtemplate}

class MainCubit extends Cubit<String> {
  MainCubit() : super('home');

  // AnimationController _colorAnimationController;
  // Animation _colorTween;

  void scrollPozish(double pos) => {
        print(pos),
        if (pos >= 0 && pos < 700)
          {
            emit('home'),
          }
        else if (pos >= 700 && pos < 1700)
          {
            emit('about'),
          }
        else if (pos >= 1700 && pos < 2700)
          {
            emit('services'),
          }
        else if (pos >= 2700 && pos < 3700)
          {
            emit('featured'),
          }
        else if (pos >= 3700 && pos < 4700)
          {
            emit('team'),
          }
        else if (pos >= 4700 && pos < 5700)
          {
            emit('contact'),
          }
      };

  void home(GlobalKey key) => {
        Scrollable.ensureVisible(key.currentContext,
            duration: const Duration(seconds: 1)),
        // emit('home'),
      };

  void about(GlobalKey key) => {
        Scrollable.ensureVisible(key.currentContext,
            duration: const Duration(seconds: 1)),
        // emit('about'),
      };
  void services(GlobalKey key) => {
        Scrollable.ensureVisible(key.currentContext,
            duration: const Duration(seconds: 1)),
        // emit('services'),
      };

  void featured(GlobalKey key) => {
        Scrollable.ensureVisible(key.currentContext,
            duration: const Duration(seconds: 1)),
        // emit('featured'),
      };

  void team(GlobalKey key) => {
        Scrollable.ensureVisible(key.currentContext,
            duration: const Duration(seconds: 1)),
        // emit('team'),
      };
  void contact(GlobalKey key) => {
        Scrollable.ensureVisible(key.currentContext,
            duration: const Duration(seconds: 1)),
        // emit('contact'),
      };
}
