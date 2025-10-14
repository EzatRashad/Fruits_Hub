import 'dart:convert';

import 'package:fruit_hub/core/services/shared_pref_service/shared_preferences_service.dart';
import 'package:fruit_hub/core/utils/constants.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
UserEntity getUserLocal() {
  var jsonString = SharedPreferencesService.getString(userData);

  if (jsonString == null || jsonString.isEmpty) {
    return UserModel(
       
      name: "ضيف",
      email: "",
       uId: '',
       
    );
  }

  return UserModel.fromJson(jsonDecode(jsonString));
}
