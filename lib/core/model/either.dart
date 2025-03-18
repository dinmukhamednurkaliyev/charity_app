abstract class Either<L, R> {
  T fold<T>(T Function(L l) left, T Function(R r) right);
}
