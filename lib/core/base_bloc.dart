import 'package:arch_sample/data/network/network_errors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseBloc extends Bloc with _CommonErrorsHandler {
  BaseBloc(super.initialState);
}

/// Override [handleError], [onConnectionError], [onAuthorizationError], [onUnexpectedError] for your Bloc to change error handling
mixin _CommonErrorsHandler on Bloc {
  void handleError(dynamic error) {
    if (error is ConnectionError) {
      onConnectionError();
    } else if (error is UnauthorizedError) {
      onAuthorizationError();
    } else {
      onUnexpectedError();
    }
  }

  void onConnectionError() {
    //todo handle error
  }

  void onAuthorizationError() {
    //todo handle error
  }

  void onUnexpectedError() {
    //todo handle error
  }
}
