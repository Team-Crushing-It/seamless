part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {
  final GlobalKey test = GlobalKey();
}

// part of 'main_cubit.dart';

// // @immutable
// class MainState {
//   const MainState({
//     this.selected = '',
//   });

//   final selected;

//   @override
//   List<Object> get props => [selected];

//   MainState copyWith({
//     String selected,
//   }) {
//     return MainState(
//       selected: selected ?? this.selected,
//     );
//   }

// // class MainInitial extends MainState {}

// }
