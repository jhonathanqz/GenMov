// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieStore on MovieStoreBase, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??=
          Computed<bool>(() => super.hasError, name: 'MovieStoreBase.hasError'))
      .value;
  Computed<bool>? _$hasMoviesComputed;

  @override
  bool get hasMovies =>
      (_$hasMoviesComputed ??= Computed<bool>(() => super.hasMovies,
              name: 'MovieStoreBase.hasMovies'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'MovieStoreBase.isLoading'))
          .value;

  late final _$_isLoadingAtom =
      Atom(name: 'MovieStoreBase._isLoading', context: context);

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$isErrorAtom =
      Atom(name: 'MovieStoreBase.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'MovieStoreBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$moviesAtom =
      Atom(name: 'MovieStoreBase.movies', context: context);

  @override
  List<Movie> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(List<Movie> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  late final _$getMoviesAsyncAction =
      AsyncAction('MovieStoreBase.getMovies', context: context);

  @override
  Future<void> getMovies() {
    return _$getMoviesAsyncAction.run(() => super.getMovies());
  }

  late final _$getTopRatedMoviesAsyncAction =
      AsyncAction('MovieStoreBase.getTopRatedMovies', context: context);

  @override
  Future<void> getTopRatedMovies() {
    return _$getTopRatedMoviesAsyncAction.run(() => super.getTopRatedMovies());
  }

  late final _$getPopularMoviesAsyncAction =
      AsyncAction('MovieStoreBase.getPopularMovies', context: context);

  @override
  Future<void> getPopularMovies() {
    return _$getPopularMoviesAsyncAction.run(() => super.getPopularMovies());
  }

  late final _$searchMoviesAsyncAction =
      AsyncAction('MovieStoreBase.searchMovies', context: context);

  @override
  Future<void> searchMovies(String query) {
    return _$searchMoviesAsyncAction.run(() => super.searchMovies(query));
  }

  late final _$clearMoviesAsyncAction =
      AsyncAction('MovieStoreBase.clearMovies', context: context);

  @override
  Future<void> clearMovies() {
    return _$clearMoviesAsyncAction.run(() => super.clearMovies());
  }

  late final _$clearErrorAsyncAction =
      AsyncAction('MovieStoreBase.clearError', context: context);

  @override
  Future<void> clearError() {
    return _$clearErrorAsyncAction.run(() => super.clearError());
  }

  @override
  String toString() {
    return '''
isError: ${isError},
errorMessage: ${errorMessage},
movies: ${movies},
hasError: ${hasError},
hasMovies: ${hasMovies},
isLoading: ${isLoading}
    ''';
  }
}
