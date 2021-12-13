// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsViewModel on _DetailsViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_DetailsViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$responseAtom = Atom(name: '_DetailsViewModelBase.response');

  @override
  HomeResponseModel? get response {
    _$responseAtom.reportRead();
    return super.response;
  }

  @override
  set response(HomeResponseModel? value) {
    _$responseAtom.reportWrite(value, super.response, () {
      super.response = value;
    });
  }

  final _$resultsAtom = Atom(name: '_DetailsViewModelBase.results');

  @override
  List<MarvelResults>? get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(List<MarvelResults>? value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  final _$getComicsAsyncAction = AsyncAction('_DetailsViewModelBase.getComics');

  @override
  Future<void> getComics() {
    return _$getComicsAsyncAction.run(() => super.getComics());
  }

  final _$_DetailsViewModelBaseActionController =
      ActionController(name: '_DetailsViewModelBase');

  @override
  void changeLoading() {
    final _$actionInfo = _$_DetailsViewModelBaseActionController.startAction(
        name: '_DetailsViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_DetailsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
response: ${response},
results: ${results}
    ''';
  }
}
