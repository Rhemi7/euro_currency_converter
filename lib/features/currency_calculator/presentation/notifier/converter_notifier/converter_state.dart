

abstract class ConverterState {
  const ConverterState();
}

class ConverterInitial extends ConverterState {
  const ConverterInitial();
}

class ConverterLoading extends ConverterState {
  const ConverterLoading();
}

class ConverterLoaded extends ConverterState {
  final double? rate;
  ConverterLoaded({this.rate});
}

class ConverterError extends ConverterState {
  String? message;
  ConverterError({this.message});
}