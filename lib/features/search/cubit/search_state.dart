part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final SearchModel products;

  SearchSuccess({required this.products});
}

final class SearchFailure extends SearchState {}
