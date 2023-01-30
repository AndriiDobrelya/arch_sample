import 'package:arch_sample/core/failures.dart';
import 'package:arch_sample/features/data/datasources/network/network_errors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/// Override [handleError], [onConnectionError], [onAuthorizationError], [onUnexpectedError] for your Bloc to change error handling
mixin CommonErrorsHandler<T,S> on Bloc<T,S> {
  void handleError(Failure error) {
    if (error is ConnectionError) {
      onConnectionError();
    } else if (error is UnauthorizedError) {
      onAuthorizationError();
    } else {
      onUnexpectedError();
    }
  }

  void onConnectionError() {
    // TODO(AndriiD): handle Connection Error
  }

  void onAuthorizationError() {
    // TODO(AndriiD): handle Authorization Error
  }

  void onUnexpectedError() {
    // TODO(AndriiD): handle Unexpected Error
  }
}
