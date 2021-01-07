import 'package:mobx/mobx.dart';
import 'package:travelpad/models/user.dart';
import 'package:travelpad/service/preference_service.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  User user;

  @action
  Future<void> login(User user) async {
    await PreferenceService.getInstance().setAuthUser(user);
    await PreferenceService.getInstance().setAuthToken(user.id);
  }

  @action
  Future<void> reset() async {
    user = await PreferenceService.getInstance().getAuthUser();
  }
}
