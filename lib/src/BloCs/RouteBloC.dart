import 'dart:async';


enum Steps {
  step1, step2
}

class RouteBloc {
  Sink<Steps> get step => _stepController.sink;
  final _stepController = StreamController<Steps>();

  RouteBloc() {

    _stepController.stream.listen((step) {
      print(step.toString());
    });
  }

}