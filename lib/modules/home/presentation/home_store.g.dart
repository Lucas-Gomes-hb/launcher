// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$appsAtom = Atom(name: '_HomeStore.apps', context: context);

  @override
  ObservableList<HomeApps> get apps {
    _$appsAtom.reportRead();
    return super.apps;
  }

  @override
  set apps(ObservableList<HomeApps> value) {
    _$appsAtom.reportWrite(value, super.apps, () {
      super.apps = value;
    });
  }

  late final _$defaultPieAppsAtom = Atom(
    name: '_HomeStore.defaultPieApps',
    context: context,
  );

  @override
  ObservableList<HomeApps> get defaultPieApps {
    _$defaultPieAppsAtom.reportRead();
    return super.defaultPieApps;
  }

  @override
  set defaultPieApps(ObservableList<HomeApps> value) {
    _$defaultPieAppsAtom.reportWrite(value, super.defaultPieApps, () {
      super.defaultPieApps = value;
    });
  }

  late final _$searchActiveAtom = Atom(
    name: '_HomeStore.searchActive',
    context: context,
  );

  @override
  bool get searchActive {
    _$searchActiveAtom.reportRead();
    return super.searchActive;
  }

  @override
  set searchActive(bool value) {
    _$searchActiveAtom.reportWrite(value, super.searchActive, () {
      super.searchActive = value;
    });
  }

  late final _$termAtom = Atom(name: '_HomeStore.term', context: context);

  @override
  String get term {
    _$termAtom.reportRead();
    return super.term;
  }

  @override
  set term(String value) {
    _$termAtom.reportWrite(value, super.term, () {
      super.term = value;
    });
  }

  late final _$pieControllerAtom = Atom(
    name: '_HomeStore.pieController',
    context: context,
  );

  @override
  PieCanvasController get pieController {
    _$pieControllerAtom.reportRead();
    return super.pieController;
  }

  @override
  set pieController(PieCanvasController value) {
    _$pieControllerAtom.reportWrite(value, super.pieController, () {
      super.pieController = value;
    });
  }

  @override
  String toString() {
    return '''
apps: ${apps},
defaultPieApps: ${defaultPieApps},
searchActive: ${searchActive},
term: ${term},
pieController: ${pieController}
    ''';
  }
}
