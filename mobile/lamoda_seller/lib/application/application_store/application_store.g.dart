// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ApplicationStore on _Store, Store {
  Computed<bool>? _$homePageModerationAlertComputed;

  @override
  bool get homePageModerationAlert =>
      (_$homePageModerationAlertComputed ??= Computed<bool>(
            () => super.homePageModerationAlert,
            name: '_Store.homePageModerationAlert',
          ))
          .value;
  Computed<bool>? _$homePageAkciaAlertComputed;

  @override
  bool get homePageAkciaAlert =>
      (_$homePageAkciaAlertComputed ??= Computed<bool>(
            () => super.homePageAkciaAlert,
            name: '_Store.homePageAkciaAlert',
          ))
          .value;

  late final _$homePageHasBrandsAtom = Atom(
    name: '_Store.homePageHasBrands',
    context: context,
  );

  @override
  bool get homePageHasBrands {
    _$homePageHasBrandsAtom.reportRead();
    return super.homePageHasBrands;
  }

  @override
  set homePageHasBrands(bool value) {
    _$homePageHasBrandsAtom.reportWrite(value, super.homePageHasBrands, () {
      super.homePageHasBrands = value;
    });
  }

  late final _$homePageHasItemsAtom = Atom(
    name: '_Store.homePageHasItems',
    context: context,
  );

  @override
  bool get homePageHasItems {
    _$homePageHasItemsAtom.reportRead();
    return super.homePageHasItems;
  }

  @override
  set homePageHasItems(bool value) {
    _$homePageHasItemsAtom.reportWrite(value, super.homePageHasItems, () {
      super.homePageHasItems = value;
    });
  }

  @override
  String toString() {
    return '''
homePageHasBrands: ${homePageHasBrands},
homePageHasItems: ${homePageHasItems},
homePageModerationAlert: ${homePageModerationAlert},
homePageAkciaAlert: ${homePageAkciaAlert}
    ''';
  }
}
