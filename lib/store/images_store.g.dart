// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImagesStore on _ImagesStore, Store {
  late final _$currentPageAtom =
      Atom(name: '_ImagesStore.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$totalPagesAtom =
      Atom(name: '_ImagesStore.totalPages', context: context);

  @override
  int get totalPages {
    _$totalPagesAtom.reportRead();
    return super.totalPages;
  }

  @override
  set totalPages(int value) {
    _$totalPagesAtom.reportWrite(value, super.totalPages, () {
      super.totalPages = value;
    });
  }

  late final _$dataLoadingAtom =
      Atom(name: '_ImagesStore.dataLoading', context: context);

  @override
  bool get dataLoading {
    _$dataLoadingAtom.reportRead();
    return super.dataLoading;
  }

  @override
  set dataLoading(bool value) {
    _$dataLoadingAtom.reportWrite(value, super.dataLoading, () {
      super.dataLoading = value;
    });
  }

  late final _$imagesAtom = Atom(name: '_ImagesStore.images', context: context);

  @override
  List<ImageModel> get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(List<ImageModel> value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  late final _$getImagesAsyncAction =
      AsyncAction('_ImagesStore.getImages', context: context);

  @override
  Future<void> getImages({required String keyword}) {
    return _$getImagesAsyncAction.run(() => super.getImages(keyword: keyword));
  }

  late final _$_ImagesStoreActionController =
      ActionController(name: '_ImagesStore', context: context);

  @override
  dynamic viewImage({required String url, required BuildContext context}) {
    final _$actionInfo = _$_ImagesStoreActionController.startAction(
        name: '_ImagesStore.viewImage');
    try {
      return super.viewImage(url: url, context: context);
    } finally {
      _$_ImagesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
totalPages: ${totalPages},
dataLoading: ${dataLoading},
images: ${images}
    ''';
  }
}
