import 'package:mobx/mobx.dart';

part 'application_store.g.dart';

class ApplicationStore = _Store with _$ApplicationStore;

abstract class _Store with Store {

  @observable
  bool homePageHasBrands = false;

  @observable
  bool homePageHasItems = false;

  @computed
  bool get homePageModerationAlert => !(homePageHasBrands && homePageHasItems);

  @computed
  bool get homePageAkciaAlert => !homePageModerationAlert;

  _Store() {}
}