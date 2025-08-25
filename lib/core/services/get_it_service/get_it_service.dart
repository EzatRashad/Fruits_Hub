import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

import '../../../features/auth/data/repos_impl/auth_repo_impl.dart';
import '../firebase_services/database_service.dart';
import '../firebase_services/firebase_auth_services.dart';
import '../firebase_services/firestore_service.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<DatabaseService>(FirestoreService());

  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    getIt<FirebaseAuthServices>(),
    getIt<DatabaseService>(),
  ));
}
