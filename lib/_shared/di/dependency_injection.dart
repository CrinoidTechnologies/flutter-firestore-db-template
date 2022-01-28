import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_template/_core/di/dependency_injection.dart';
import 'package:grocery_template/_shared/utils/firebase_utils.dart';
import 'package:grocery_template/_shared/utils/logger_utls.dart';
import 'package:grocery_template/_shared/utils/storage_util.dart';
import 'package:grocery_template/app/utils/app_storage_util.dart';
import 'package:logger/logger.dart';

final sharedSL = GetIt.instance;

Future<void> initSharedServiceLocator() async {
  await initCoreServiceLocator();

  /// logger
  sharedSL.registerSingleton<Logger>(Logger());

  /// firebase
  await setupFirebase();

  sharedSL.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  sharedSL.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);

  sharedSL.registerSingleton<FirebaseFunctions>(FirebaseFunctions.instance);

  sharedSL.registerSingleton<FirebaseStorage>(FirebaseStorage.instance);

  // ///Uuid - required for generating unique file names
  // sharedSL.registerSingleton<Uuid>(Uuid());

  /// Persistent storage
  var result = await GetStorage.init();
  if (!result)
    logE('Persistent storage is unable to initialize');
  else
    logD('Persistent storage is initialized');
  sharedSL.registerSingleton<StorageUtil>(AppStorageUtil(GetStorage()));

  ///Authentication......................

  /// data

  /// domain

  /// presentation
}
