import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';


part 'user.g.dart';

@JsonSerializable()
class User extends _User with _$User {
  static User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static Map<String, dynamic> toJson(User user) => _$UserToJson(user);
}

abstract class _User with Store {
  @observable
  String id;

  @observable
  @JsonKey(name: 'username')
  String userName;

  @observable
  String email;

  @observable
  String password;
}
