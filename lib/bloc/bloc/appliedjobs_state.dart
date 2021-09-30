part of 'appliedjobs_bloc.dart';

@immutable
abstract class AppliedjobsState {}

class AppliedjobsInitialState extends AppliedjobsState {}

class AppliedjobsLoadingState extends AppliedjobsState {}

class AppliedjobsILoadedState extends AppliedjobsState {}

class AppliedjobsErrorState extends AppliedjobsState {}
