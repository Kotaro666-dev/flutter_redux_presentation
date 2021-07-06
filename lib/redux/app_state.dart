import 'package:flutter/cupertino.dart';

@immutable
class AppState {
  final String output;

  const AppState({
    this.output,
  });

  factory AppState.initialize() => const AppState(output: 'Initialized');

  AppState copyWith({
    String output,
  }) {
    return new AppState(
      output: output ?? this.output,
    );
  }
}
