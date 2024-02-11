/// [DataState] create a contract if the data is success or
/// data is fail
abstract class DataState<T> {
  final T? data;
  final String? error;

  DataState({
    this.data,
    this.error,
  });
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(String error) : super(error: error);
}